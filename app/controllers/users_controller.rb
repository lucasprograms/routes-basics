class UsersController < ApplicationController
  def index
    if params[:search]
      search_params = "%#{params[:search].upcase}%"
      render json: User.where('UPPER(users.username) LIKE ?', search_params)
    else
      render json: User.all
    end
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
    user = User.destroy(params[:id])
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end