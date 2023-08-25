class Admin::BoardsController < ApplicationController
  def index
    @boards = current_user.boards
  end

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def update
    @board = current_user.boards.find(params[:id])
    if @board.update(board_params)
      redirect_to admin_boards_path
    else
      render :edit
    end
  end

  def destroy
    @board = current_user.boards.find(params[:id])
    @board.destroy
    redirect_to admin_boards_path, status: :see_other
  end

  private

  def board_params
    params.require(:board).permit(:name, :description, :board_type, :price, :photos)
  end
end
