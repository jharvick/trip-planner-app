class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def create
    @user = User.create(
      name: params[:name],
      email: params[:email],
      password_digest: params[:password_digest],
    )
    render :show
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end
end
