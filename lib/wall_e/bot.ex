defmodule WallE.Bot do
  use Slack

  def init(initial_state, slack) do
    IO.puts "Connected as #{slack.me.name}"
    {:ok, initial_state} 
  end

  def handle_message(message = %{type: "message"}, slack, state) do
    IO.puts "message"
    IO.inspect message

    if Regex.match?(~r/cool/, message.text) do
      send_message("ICE COLD!", message.channel, slack)
    end
    {:ok, state ++ [message.text]}
  end

  def handle_message(_message, _slack, state) do
    IO.puts "Not implemented: #{inspect state}"
    {:ok, state}
  end
end
