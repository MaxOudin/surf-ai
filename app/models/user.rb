class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :boards, dependent: :destroy
  # my bookings -> la ou booking.board.user_id == current_user.id
  has_many :rents, through: :boards, source: :bookings
  # bookings -> bookings ou user_id == current_user.id
  has_many :bookings, dependent: :destroy
  validates :first_name, :last_name, :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
