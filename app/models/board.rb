class Board < ApplicationRecord
  BOARDTYPES = %w[shortboard fish longboard]

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many :reviews

  validates :name, :price, presence: true
  validates :board_type, inclusion: { in: BOARDTYPES }

  has_many_attached :photos

  def calcul_average
    review_nb = self.reviews.count
    reviews_sum = self.reviews.sum(:rating)
    average = reviews_sum.fdiv(review_nb).round(1)
    self.average_rating = average
    self.save
  end
end
