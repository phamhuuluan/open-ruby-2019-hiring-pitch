class DropColunmTimeBookings < ActiveRecord::Migration[6.0]
  def up
    remove_column :bookings, :start_time
    remove_column :bookings, :end_time
  end

  def down
    add_column :bookings, :start_time, :datetime
    add_column :bookings, :end_time, :datetime
  end
end
