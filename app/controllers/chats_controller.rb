class ChatsController < ApplicationController

  def show
    @room = Room.find(params[:id])
    @chat = @room.chat
    @friends = current_user.users
    render 'rooms/chat'
  end

end
