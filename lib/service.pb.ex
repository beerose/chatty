defmodule Chatty.SendMessageRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
    chat_message: Chatty.ChatMessage.t
  }
  defstruct [:chat_message]

  field :chat_message, 1, type: Chatty.ChatMessage
end

defmodule Chatty.SendMessageReply do
  @moduledoc false
  use Protobuf, syntax: :proto3

  defstruct []

end

defmodule Chatty.FetchMessagesRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  defstruct []

end

defmodule Chatty.FetchMessagesReply do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
    messages: [Chatty.ChatMessage.t]
  }
  defstruct [:messages]

  field :messages, 1, repeated: true, type: Chatty.ChatMessage
end

defmodule Chatty.ChatMessage do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
    sender: String.t,
    text:   String.t
  }
  defstruct [:sender, :text]

  field :sender, 1, type: :string
  field :text, 2, type: :string
end

defmodule Chatty.ChatService.Service do
  @moduledoc false
  use GRPC.Service, name: "chatty.ChatService"

  rpc :SendMessage, Chatty.SendMessageRequest, Chatty.SendMessageReply
  rpc :FetchMessages, Chatty.FetchMessagesRequest, Chatty.FetchMessagesReply
end

defmodule Chatty.ChatService.Stub do
  @moduledoc false
  use GRPC.Stub, service: Chatty.ChatService.Service
end

