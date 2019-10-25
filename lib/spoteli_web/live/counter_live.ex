defmodule SpoteliWeb.CounterLive do
  use Phoenix.LiveView
  alias SpoteliWeb.CounterView
  alias NimbleCSV.RFC4180, as: CSV

  def render(assigns) do
    CounterView.render("index.html", assigns)
  end

  def mount(_session, socket) do
    {:ok, assign(socket, strand: "ATCC")}
  end

  def handle_event("build", %{"strand" => strand}, socket) do
    {:ok, strand} = Map.fetch(strand, "strand")
    built = complementarity(strand)

    {:noreply, assign(socket, strand: built)}
  end

  def complementarity(strand) do
    strand
    |> split_strand
    |> Enum.map(fn
      "A" -> "T"
      "T" -> "A"
      "C" -> "G"
      "G" -> "C"
      _ -> raise "Incorrect nucleotide `Nucleotides [A, C, T, G]`"
    end)
    |> to_rna
    |> List.to_string
  end

  defp split_strand(strand) do
    strand
    |> String.upcase
    |> String.graphemes()
  end

  defp to_rna(strand) do
    strand
    |> Enum.map(fn
      "A" -> "U"
      "T" -> "A"
      "C" -> "G"
      "G" -> "C"
      _ -> raise "Incorrect nucleotide `Nucleotides [A, C, T, G]`"
    end)
  end

  def parse_csv() do
    "codon.csv"
    |> File.read!
    |> CSV.parse_string
    |> Enum.map(fn ([name | codons]) -> %{name: name, codons: codons} end)
  end
end
