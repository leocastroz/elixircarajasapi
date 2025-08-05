defmodule ElixircarajasapiWeb.PageController do
  use ElixircarajasapiWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
