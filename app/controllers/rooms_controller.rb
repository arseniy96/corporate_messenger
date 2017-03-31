class RoomsController < ApplicationController

  before_action :set_user, only: [:index, :show, :new, :edit]
  before_action :set_room, only: [:show, :edit, :update, :destroy, :invite_friends]

  def index

  end

  def show
    render_404 unless @room
    @user = User.find(@room.creator_id)
    @friends = current_user.users
    render_403 unless @room.users.include?(current_user)
  end

  def new
    @room = Room.new
    @chat = Chat.new
  end

  def edit
    render_404 unless @room
    if user_signed_in? && @room.creator_id != current_user.id
      redirect_to chat_path
    end
  end

  def create
    @room = Room.new(room_params)
    @room.creator_id = current_user.id
    if @room.save
      @room.users << current_user
      @chat = Chat.create
      @room.chat = @chat
      redirect_to @room
    else
      render action: 'new'
    end
  end

  def update
    if @room.update(room_params)
      redirect_to @room
    else
      render action: 'edit'
    end
  end

  def destroy
    @room.destroy

    redirect_to rooms_path
  end

  def invite_friends
    @friend = User.find(params[:user_id])
    @room.users << @friend
    redirect_to @room
  end

  private

  def set_user
    if user_signed_in?
      @user = current_user
    end
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:title, :description)
  end

end

