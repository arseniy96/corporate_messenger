class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :title
      t.text :description
      t.integer :creator_id

      t.timestamps null: false
    end
  end
end
