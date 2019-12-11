class CreateProfileUsers < ActiveRecord::Migration[6.0]
  def up
    create_table :profile_users do |t|
      t.string :phone
      t.string :address
      t.string :avatar
      
      t.timestamps
    end
  end

  def down
    drop_table :products
  end
end
