class BoardsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @board = Board.new
  end
  
  def show
    @board = Board.find(params[:id])
  end
  
  def create
    @user = User.find(params[:user_id])
    @board = Board.new(board_params)
    @board.user = @board
    if @board.save
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def board_params
    params.require(:board).permit(:name, :description, :board_type, :price, photos: [])
  end
  
end

  

