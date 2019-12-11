class AddIndexPitches < ActiveRecord::Migration[6.0]
  def change
    add_index :pitches, [:user_id, :created_at]
  end
end
