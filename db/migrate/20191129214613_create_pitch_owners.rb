class CreatePitchOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :pitch_owners do |t|
      t.integer :owner_id
      t.integer :pitch_id

      t.timestamps
    end
  end
end
