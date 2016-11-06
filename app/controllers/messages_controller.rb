class MessagesController < ApplicationController

  def create
    @room = Room.find(params[:id])
    @chat = @room.chat
    @message = @chat.messages.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      redirect_to chats_path
    else
      render @chat
    end
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end

end
