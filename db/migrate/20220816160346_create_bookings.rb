class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :name
      t.float :price
      t.belongs_to :currency
      t.datetime :check_in
      t.datetime :check_out
      t.string :guest_name
      t.string :guest_email 
      t.timestamps
    end
  end
end
