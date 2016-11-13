class CreateFriends < ActiveRecord::Migration[5.0]
  def change
    create_table :friends do |t|
      t.belongs_to :user, index: true
      t.belongs_to :friend, index: true

      t.timestamps
    end
  end
end
