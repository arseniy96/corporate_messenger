class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :creator_id
      t.boolean :complete, default: false
      t.datetime :date
      t.references :room

      t.timestamps
    end
  end
end
