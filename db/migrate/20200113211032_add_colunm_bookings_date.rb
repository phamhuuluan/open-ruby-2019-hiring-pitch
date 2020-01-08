class AddColunmBookingsDate < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :booking_day, :datetime
  end
end
