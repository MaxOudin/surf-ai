class AddAverageRatingToBoards < ActiveRecord::Migration[7.0]
  def change
    add_column :boards, :average_rating, :float
  end
end
