defmodule CatChatOtp.Macros.DynamicSupervisorTemplate do
  @moduledoc """
  Dynamic Supervisor template

  The Dynamic Supervisor contains a bit of boilerplate that can be extrapolated.
  This module implements the init/1 and child_spec/1 callbacks, while using
  a custom init_spec/1 function for it's own start up options.
  """

  defmacro __using__(_opts) do
    quote do
      use DynamicSupervisor

      def init(opts) do
        opts
        |> init_spec()
        |> DynamicSupervisor.init()
      end

      def init_spec(_opts) do
        [strategy: :one_for_one]
      end

      def child_spec(_opts) do
        %{
          id: __MODULE__,
          start: {__MODULE__, :start_link, []},
          restart: :permanent,
          type: :supervisor
        }
      end
    end
  end
end
