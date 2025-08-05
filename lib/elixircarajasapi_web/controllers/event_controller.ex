defmodule ElixircarajasapiWeb.EventController do
  use ElixircarajasapiWeb, :controller

  @doc """
  Home check endpoint.
  """
  def index(conn, _params) do
    conn
    |> put_status(200)
    |> json([
      %{
        evento: %{
          nome: "Tech Summit Parauapebas 2024",
          descricao: "Evento anual de tecnologia e inovação.",
          data: "2024-08-15",
          horario: "09:00-18:00",
          local: %{
            nome: "Centro de Convenções Parauapebas",
            endereco: %{
              logradouro: "Av. das Nações",
              numero: "1000",
              bairro: "Centro",
              cep: "68515-000",
              cidade: "Parauapebas",
              estado: "PA"
            }
          },
          dados_evento: %{
            tipo: "Conferência",
            status: "Confirmado",
            organizacao: "Associação de Tecnologia do Pará"
          },
          ministrante: %{
            nome: "Dr. Ana Silva",
            dados: %{
              cpf: "123.456.789-00",
              email: "ana.silva@techsummit.com",
              instituicao: "UFPA",
              especialidade: "Inteligência Artificial"
            }
          },
          palestrantes: [
            %{
              nome: "Carlos Souza",
              dados: %{
                cpf: "987.654.321-00",
                email: "carlos.souza@inova.com",
                instituicao: "InovaTech",
                especialidade: "Cloud Computing"
              }
            },
            %{
              nome: "Mariana Lima",
              dados: %{
                cpf: "456.789.123-00",
                email: "mariana.lima@devparauapebas.com",
                instituicao: "DevParauapebas",
                especialidade: "Desenvolvimento Web"
              }
            }
          ],
          participantes: [
            %{nome: "João Pereira", email: "joao.pereira@gmail.com"},
            %{nome: "Fernanda Costa", email: "fernanda.costa@gmail.com"}
          ],
          brindes: [
            %{descricao: "Camiseta Tech Summit", quantidade: 200},
            %{descricao: "Caneca personalizada", quantidade: 150}
          ],
          brindes_entregues: [
            %{brinde: "Camiseta Tech Summit", pessoa: "João Pereira"},
            %{brinde: "Caneca personalizada", pessoa: "Fernanda Costa"}
          ]
        }
      },
      %{
        evento: %{
          nome: "Workshop Elixir Avançado",
          descricao: "Aprenda técnicas avançadas de Elixir com especialistas.",
          data: "2024-09-10",
          horario: "14:00-20:00",
          local: %{
            nome: "Auditório UFPA",
            endereco: %{
              logradouro: "Rua Universitária",
              numero: "500",
              bairro: "Universitário",
              cep: "68515-010",
              cidade: "Parauapebas",
              estado: "PA"
            }
          },
          dados_evento: %{
            tipo: "Workshop",
            status: "Confirmado",
            organizacao: "UFPA"
          },
          ministrante: %{
            nome: "Prof. Lucas Martins",
            dados: %{
              cpf: "321.654.987-00",
              email: "lucas.martins@ufpa.br",
              instituicao: "UFPA",
              especialidade: "Programação Funcional"
            }
          },
          palestrantes: [
            %{
              nome: "Amanda Torres",
              dados: %{
                cpf: "654.321.987-00",
                email: "amanda.torres@elixir.com",
                instituicao: "Elixir Brasil",
                especialidade: "Elixir para Web"
              }
            }
          ],
          participantes: [
            %{nome: "Pedro Alves", email: "pedro.alves@gmail.com"},
            %{nome: "Carla Mendes", email: "carla.mendes@gmail.com"}
          ],
          brindes: [
            %{descricao: "Livro Elixir", quantidade: 50}
          ],
          brindes_entregues: [
            %{brinde: "Livro Elixir", pessoa: "Pedro Alves"}
          ]
        }
      }
    ])
    # |> text("Home check successful")
  end
end
