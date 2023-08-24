class Admin::BookingsController < ApplicationController
  def index
    # Find all the boards owned by the current user
    # Initialize an empty array to store all bookings
    @review = Review.new
    @bookings = current_user.bookings
  end
    # Loop through each board and find its bookings
    # @boards.each do |board|
    #   # Find the bookings associated with this board
    #   board_bookings = board.bookings
    #   @bookings.concat(board_bookings) if board_bookings.any?
    # end

  def rents
    @bookings = current_user.rents
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
