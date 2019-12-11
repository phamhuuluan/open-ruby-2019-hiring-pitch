class DropPitchOwners < ActiveRecord::Migration[6.0]
  def change
    drop_table :pitch_owners
  end
end
