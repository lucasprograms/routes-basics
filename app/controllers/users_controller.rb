class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(params.require(:user).permit(:email, :name))
    
    if user.save!
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    user = User.update(params[:id], user_params)
    if user.errors.full_messages.any?
      render json: user.errors.full_messages, status: :unprocessable_entity
    else
      render json: user
    end
  end

  def destroy
    User.destroy(params[:id])
    render json: User.all
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end