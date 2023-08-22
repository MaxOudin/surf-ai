class BoardsController < ApplicationController
  before_action :find_user_id, only: %i[new create]
  before_action :authenticate_user!
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user = @user
    if @board.save
      redirect_to boards_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def find_user_id
    @user = User.find(params[:user_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def board_params
    params.require(:board).permit(:name, :description, :board_type, :price, :user_id, photos: [])
  end
end
