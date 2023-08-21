class BoardsController < ApplicationController
  before_action :set_board, only: %i[show]
  def show
  end

  private

  def set_board
    params.require(:boards).permit(:name, :board_type, :description, :price)
  end
end
