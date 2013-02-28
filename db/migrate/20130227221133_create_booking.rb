class CreateBooking < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :description
      t.date :from
      t.date :to
      t.datetime :collect_at
      t.datetime :return_at
      t.references :user, :null => false
      t.text :comments
      t.references :status, :null => false

      t.timestamps
    end
  end
end
