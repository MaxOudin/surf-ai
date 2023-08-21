class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :date_start
      t.date :date_end
      t.references :user, null: false, foreign_key: true
      t.references :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
