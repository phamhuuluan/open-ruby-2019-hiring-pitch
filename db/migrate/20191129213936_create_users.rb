class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :phone
      t.string :address
      t.string :avatar
      t.string :email
      t.string :password_digest
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
