class CreatePitches < ActiveRecord::Migration[6.0]
  def change
    create_table :pitches do |t|
      t.text :description
      t.string :address
      t.string :image
      t.datetime :start_time
      t.datetime :end_time
      t.float :price
      t.integer :status

      t.timestamps
    end
  end
end
