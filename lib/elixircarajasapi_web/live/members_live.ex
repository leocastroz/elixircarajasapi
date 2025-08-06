defmodule ElixircarajasapiWeb.MembersLive do
  use ElixircarajasapiWeb, :live_view

  def mount(_params, _session, socket) do
    events = fetch_events()
    {:ok, assign(socket, events: events)}
  end

  defp fetch_events do
    url = "http://localhost:4000/api/v1/event"

    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        case Jason.decode(body) do
          {:ok, data} -> data
          _ -> []
        end

      _ ->
        []
    end
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1>Eventos e Participantes</h1>
      <%= for %{"evento" => evento} <- @events do %>
        <div style="margin-bottom: 2rem;">
          <h2><%= evento["nome"] %></h2>
          <p><%= evento["descricao"] %></p>
          <p><strong>Data:</strong> <%= evento["data"] %> — <strong>Horário:</strong> <%= evento["horario"] %></p>
          <p><strong>Local:</strong> <%= evento["local"]["nome"] %>, <%= evento["local"]["endereco"]["cidade"] %></p>

          <h3>Participantes:</h3>
          <ul>
            <%= for participante <- evento["participantes"] do %>
              <li><%= participante["nome"] %> — <%= participante["email"] %></li>
            <% end %>
          </ul>
        </div>
      <% end %>
    </div>
    """
  end
end
