class Board < ApplicationRecord
  BOARDTYPES = %w[shortboard fish longboard]

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  validates :name, :price, presence: true
  validates :board_type, inclusion: { in: BOARDTYPES }

  has_many_attached :photos
end
