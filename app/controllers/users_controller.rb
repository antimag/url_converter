class UsersController < ApplicationController
  
  def generate_key
    user = User.create(user_params)
    if user.errors.blank?
      render json: user, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: 400
    end        
  end

  private

  def user_params
    params.permit(:name, :email)
  end

end
