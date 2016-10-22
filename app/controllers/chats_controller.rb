class ChatsController < ApplicationController

  def index
    if user_signed_in?
      @user = current_user
    else
      redirect_to root_path
    end
  end

  def show
    @chat = Chat.find(params[:id])
    @user = User.find(@chat.user_creator_id)
    render_403 unless @chat.users.include?(current_user)
  end

  def new
    @chat = Chat.new
  end

  def edit
    @chat = Chat.find(params[:id])
    if !(user_signed_in?) && @chat.user_creator_id != current_user.id
      redirect_to chat_path
    end
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.user_creator_id = current_user.id
    if @chat.save
      @chat.users << current_user
      redirect_to @chat
    else
      render action: 'new'
    end
  end

  def update
    @chat = Chat.find(params[:id])
    if @chat.update(chat_params)
      redirect_to @chat
    else
      render action: 'edit'
    end
  end

  def destroy
    @chat = Chat.find(params[:id])
    if user_signed_in? && @chat.user_creator_id == current_user.id
      @chat.destroy
    end
    redirect_to chats_path
  end

  private

  def chat_params
    params.require(:chat).permit(:title, :description)
  end

end
