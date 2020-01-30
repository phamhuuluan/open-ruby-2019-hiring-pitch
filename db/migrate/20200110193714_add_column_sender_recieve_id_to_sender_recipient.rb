class AddColumnSenderRecieveIdToSenderRecipient < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_pitch_reactions, :reactions, polymorphic: true
  end
end
