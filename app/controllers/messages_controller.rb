class MessagesController < ApplicationController

  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      redirect_to @chat
    else
      render @chat
    end
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end

end
