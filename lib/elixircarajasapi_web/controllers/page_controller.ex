defmodule ElixircarajasapiWeb.PageController do
  use ElixircarajasapiWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end

  def about(conn, _params) do
    render(conn, :about)
  end
  
  def members(conn, _params) do
    render(conn, :members)
  end
  
end
