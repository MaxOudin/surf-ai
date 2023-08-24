class Review < ApplicationRecord
  RATINGS = [0, 1, 2, 3, 4, 5]
  belongs_to :board

  validates :comment, :rating, presence: true
  validates :rating, inclusion: { in: RATINGS }

  after_create :calculate_board_rating

  def calculate_board_rating
    self.board.calcul_average
  end
end
