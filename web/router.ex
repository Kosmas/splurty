defmodule Splurty.Router do
  use Splurty.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Splurty do
    pipe_through :browser # Use the default browser stack

    get "/", QuoteController, :homepage
  end

  # Other scopes may use custom stacks.
  # scope "/api", Splurty do
  #   pipe_through :api
  # end
end
