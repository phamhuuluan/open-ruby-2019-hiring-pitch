class CreateUserPitchReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_pitch_reactions do |t|
      t.integer :user_id
      t.integer :pitch_id
      t.integer :user_pitch_id
      t.string :user_pitch_type

      t.timestamps
    end
  end
end
