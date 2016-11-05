class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.references :room

      t.timestamps null: false
    end
  end
end
