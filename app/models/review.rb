class Review < ApplicationRecord
  RATINGS = [0, 1, 2, 3, 4, 5]
  belongs_to :board

  validates :comment, :rating, presence: true
  validates :rating, inclusion: { in: RATINGS }
end
