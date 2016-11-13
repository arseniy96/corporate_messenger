class ChatsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params['chat_id']}_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    # process data sent from the page
    current_user.messages.create!(text: data['message'], chat_id: data['chat_id'])
  end
end