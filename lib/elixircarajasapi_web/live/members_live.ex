defmodule ElixircarajasapiWeb.MembersLive do
  use ElixircarajasapiWeb, :live_view

  def mount(_params, _session, socket) do
    events = fetch_events()
    {:ok, assign(socket, events: events, modal_event: nil)}
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

  # Evento que abre o modal
  def handle_event("open_modal", %{"index" => index}, socket) do
    index = String.to_integer(index)
    event = Enum.at(socket.assigns.events, index)
    {:noreply, assign(socket, modal_event: event)}
  end

  # Fecha o modal
  def handle_event("close_modal", _params, socket) do
    {:noreply, assign(socket, modal_event: nil)}
  end

  def render(assigns) do
    ~H"""
    <div>
      <h1 class="text-2xl font-bold mb-4">Eventos e Participantes</h1>

      <%= for { %{"evento" => evento}, index } <- Enum.with_index(@events) do %>
        <div class="mt-6 p-4 border rounded shadow">
          <h2 class="text-xl font-semibold"><%= evento["nome"] %></h2>
          <p><%= evento["descricao"] %></p>
          <button
            class="mt-2 px-3 py-1 bg-blue-600 text-white rounded cursor-pointer"
            phx-click="open_modal"
            phx-value-index={index}
          >
            Ver Detalhes
          </button>
        </div>
      <% end %>

      <%= if @modal_event do %>
        <div class="fixed inset-0 bg-sky-800/50 flex items-center justify-center z-50">
          <div class="bg-blue-600 p-6 rounded-lg shadow-lg max-w-2xl w-full relative">
            <button class="absolute top-2 right-2 text-gray-500 cursor-pointer" phx-click="close_modal">✖</button>
            <% evento = @modal_event["evento"] %>
            <h2 class="text-2xl font-bold mb-2"><%= evento["nome"] %></h2>
            <p class="mb-2"><%= evento["descricao"] %></p>
            <p><strong>Data:</strong> <%= evento["data"] %> — <strong>Horário:</strong> <%= evento["horario"] %></p>
            <p><strong>Local:</strong> <%= evento["local"]["nome"] %>, <%= evento["local"]["endereco"]["cidade"] %></p>
            <p><strong>Ministrante:</strong> <%= evento["ministrante"]["nome"] %></p>

            <h3 class="mt-4 font-semibold">Participantes:</h3>
            <ul class="list-disc list-inside">
              <%= for participante <- evento["participantes"] do %>
                <li><%= participante["nome"] %> — <%= participante["email"] %></li>
              <% end %>
            </ul>
          </div>
        </div>
      <% end %>
      
    </div>
    """
  end
end
