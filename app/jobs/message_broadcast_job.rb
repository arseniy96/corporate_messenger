class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chat_#{message.chat.id}_channel",
                                 message: render_message(message)
  end

  private

  def render_message(message)
    MessagesController.render partial: 'messages/current_user_message', locals: {message: message}
  end
end