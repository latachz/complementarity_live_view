defmodule SpoteliWeb.Router do
  use SpoteliWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_layout, {SpoteliWeb.LayoutView, :app}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SpoteliWeb do
    pipe_through :browser

    live("/", CounterLive)
  end

  # Other scopes may use custom stacks.
  # scope "/api", SpoteliWeb do
  #   pipe_through :api
  # end
end
