class AddUserCreatorToChats < ActiveRecord::Migration
  def change
    add_column :chats, :user_creator_id, :integer
  end
end
