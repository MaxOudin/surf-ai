class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @board = Board.find(params[:board_id])
    @booking.user = current_user
    @booking.board = @board
    if @booking.save
      redirect_to board_path(@board)
    else
      render "boards/show", status: :unprocessable_entity
    end
  end

  # def destroy
  #   @booking = booking.find(params[:id])
  #   @booking.destroy
  #   redirect_to board_path(@booking.board), status: :see_other
  # end

  private

  def booking_params
    params.require(:booking).permit(:date_start, :date_end, :board_id, :user_id)
  end
end
