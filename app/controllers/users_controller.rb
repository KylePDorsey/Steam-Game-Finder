class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to games_path, notice: "User successfully created."
    else
    	params.permitted?
      redirect_to games_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:steam_name, :email, :password)
  end
end