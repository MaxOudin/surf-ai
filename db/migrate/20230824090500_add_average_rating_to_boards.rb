class AddAverageRatingToBoards < ActiveRecord::Migration[7.0]
  def change
    add_column :boards, :average_rating, :float, default: 0.00
  end
end
