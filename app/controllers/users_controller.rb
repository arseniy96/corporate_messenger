class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @friends = @user.users
    @potential_friends = []
    people = User.all
    people.each do |person|
      if person.users.include?(current_user)
        @potential_friends << person
      end
    end
  end

  def add_friend
    @friend = User.find(params[:id])
    current_user.users << @friend
    redirect_to user_path(@friend)
  end

end
