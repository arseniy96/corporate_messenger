class ChatsController < ApplicationController

  def index
    @chats = Chat.all
  end

  def show
    @chat = Chat.find(params[:id])
    @user_id = UserChat.where(chat_id: @chat.id).first.user_id
    @user = User.find(@user_id)
  end

  def new
    @chat = Chat.new
  end

  def edit
    @chat = Chat.find(params[:id])
  end

  def create
    @chat = Chat.new(chat_params)
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
    @chat.destroy

    redirect_to chats_path
  end

  private

  def chat_params
    params.require(:chat).permit(:title, :description)
  end

end
