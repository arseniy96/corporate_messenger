class ChatsController < ApplicationController

  def show
    # @chat = Chat.includes(:messages).find_by(id: params[:id])
    @room = Room.find(params[:id])
    @chat = @room.chat
    @message = Message.new
    @friends = current_user.users
    render 'rooms/chat'
  end

end
