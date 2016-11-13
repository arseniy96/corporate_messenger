class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :title
      t.text :description
      t.integer :creator_id

      t.timestamps
    end
  end
end