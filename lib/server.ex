defmodule Chatty.ChatService.Server do
  use GRPC.Server, service: Chatty.ChatService.Service

  def send_message(request, _stream) do
    Chatty.ChatState.put_message(request.chat_message)
    Chatty.SendMessageReply.new()
  end

  def fetch_messages(_request, _stream) do
    messages = Chatty.ChatState.get_messages()
    Chatty.FetchMessagesReply.new(messages: messages)
  end
  
end
