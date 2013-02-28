class CreateItemBookings < ActiveRecord::Migration
  def change
    create_table :item_bookings do |t|
      t.references :item
      t.references :booking

      t.timestamps
    end
  end
end
