class BoardsController < ApplicationController
  before_action :find_user_id, only: %i[new create]
  before_action :authenticate_user!
  def index
    @boards = Board.all.order(updated_at: :desc)
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR description ILIKE :query OR board_type ILIKE :query"
      @boards = @boards.where(sql_subquery, query: "%#{params[:query]}%")
    end
    @users = User.joins(:boards).distinct
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {user: user}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @board = Board.find(params[:id])
    @booking = Booking.new
    @board.calcul_average
    @markers = [
      {
        lat: @board.user.latitude,
        lng: @board.user.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {user: @board.user}),
        marker_html: render_to_string(partial: "marker")
      }
    ]
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
