defmodule Chatty.ChatState do
  @moduledoc """
    This module holds the current state. 
    Allows to add new messages.
    The first method is required for the supervisor tree to automatically 
    create an agent when the application starts up. 
  """

  @doc """
    Start worker
  """
  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end
  
  @doc """
   Put a new message
  """
  def put_message(message) do
    Agent.update(__MODULE__, &Map.put_new(&1, :os.system_time(:millisecond), message))
  end

  @doc """
    Retrieve all messages
  """
  def get_messages() do
    Agent.get(__MODULE__, &(&1)) |> Map.values
  end
end