class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :board

  validates :date_start, :date_end, presence: true
end
