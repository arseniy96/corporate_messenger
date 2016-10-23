class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @friends = @user.users
  end

  def add_friend
    @friend = User.find(params[:id])
    current_user.users << @friend
    redirect_to user_path(@friend)
  end

end
