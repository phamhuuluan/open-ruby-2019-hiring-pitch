class DropProfileUserTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :profile_users
  end
end
