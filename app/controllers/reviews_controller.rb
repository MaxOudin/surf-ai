class ReviewsController < ApplicationController
  # def new
  #   @review = Review.new
  #   @board = Board.find(params[:board_id])
  #   raise
  # end
  

  def create
    @review = Review.new(review_params)
    @board = Board.find(params[:board_id])
    @review.board = @board
    if @review.save
      redirect_to board_path(@board)
    else
      render :new, status: :unprocessable_entity
    end
    @board.calcul_average
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating, :board_id)
  end
end
