class DropColumnUserPitchReactions < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_pitch_reactions, :user_pitch_id
    remove_column :user_pitch_reactions, :user_pitch_type
  end
end
