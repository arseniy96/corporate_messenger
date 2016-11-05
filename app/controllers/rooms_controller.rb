class RoomsController < ApplicationController

  def index
    if user_signed_in?
      @user = current_user
    end
  end

  def show
    @room = Room.find(params[:id])
    render_404 unless @room
    @user = User.find(@room.creator_id)
    @friends = current_user.users
    render_403 unless @room.users.include?(current_user)
  end

  def new
    @room = Room.new
  end

  def edit
    @room = Room.find(params[:id])
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
      redirect_to @room
    else
      render action: 'new'
    end
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to @room
    else
      render action: 'edit'
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    redirect_to rooms_path
  end

  def invite_friends
    @room = Room.find(params[:id])
    @friend = User.find(params[:user_id])
    @room.users << @friend
    redirect_to @room
  end

  private

  def room_params
    params.require(:room).permit(:title, :description)
  end

end
