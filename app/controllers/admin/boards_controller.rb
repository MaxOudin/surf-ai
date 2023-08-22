class Admin::BoardsController < ApplicationController
  def index
    @boards = current_user.boards
  end
end
