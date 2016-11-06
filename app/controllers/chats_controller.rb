class ChatsController < ApplicationController

  def show
    @room = Room.find(params[:id])
    @chat = @room.chat
    render 'rooms/chat'
  end

end
