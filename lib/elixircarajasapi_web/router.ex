defmodule ElixircarajasapiWeb.Router do
  use ElixircarajasapiWeb, :router

  @session_options [
    store: :cookie,
    key: "_elixircarajas_key",
    signing_salt: "algum_salt"
  ]

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ElixircarajasapiWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElixircarajasapiWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/about", PageController, :about
    # get "/members", PageController, :members

    live_session :default, session: @session_options do
      live "/members", MembersLive
    end

    get "/api/v1/event", EventController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixircarajasapiWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:elixircarajasapi, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ElixircarajasapiWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
