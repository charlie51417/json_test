class UsersController < ApplicationController
  def index
    users = User.page(params[:page]).per(10)
    render json: {
      users: users.as_json(only: [:id, :name, :email]),
      total_pages: users.total_pages,
      current_page: users.current_page,
    }, status: :ok
  end
end
