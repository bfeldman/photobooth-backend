class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :find_user]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end
  
  def find_user
    @username = params[:username]
    if @username
      found_user = User.find_by(username: @username)
    end
    render json: { user: UserSerializer.new(found_user)}, status: :ok
  end
  

  private

  def user_params
    params.require(:user).permit(:username, :password, :email_address, :is_public)
  end
end