class CreateUserRooms < ActiveRecord::Migration
  def change
    create_table :user_rooms do |t|
      t.belongs_to :user, index: true
      t.belongs_to :room, index: true

      t.timestamps null: false
    end
  end
end
