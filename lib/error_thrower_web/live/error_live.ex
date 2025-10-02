defmodule ErrorThrowerWeb.ErrorLive do
  use ErrorThrowerWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_event("trigger_match_error", _params, socket) do
    {:ok, _} = :atom
    {:noreply, socket}
  end

  @impl true
  def handle_event("trigger_function_clause_error", _params, socket) do
    URI.parse(:wrong_argument)
    {:noreply, socket}
  end

  @impl true
  def handle_event("trigger_argument_error", _params, socket) do
    :erlang.binary_to_integer("")
    {:noreply, socket}
  end
end
