
class UsersController < ApplicationController
	include HTTParty

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

  def show
  	if logged_in?
  		@url =  "http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=3B0D465BC26FCAFF0D39AEF3724A9522&include_played_free_games=1&include_appinfo=1&steamid=76561197965143225&format=json"
  		 ret = HTTParty.get(@url.to_str) 
  		 @info = ret.parsed_response["response"]
  		 # @info["games"].each do |game|
	    #   Game.create(game["appid"]
	    #     game["playtime_forever"]

  		 # end

 

  	end
  end


  private

  def user_params
    params.require(:user).permit(:steam_name, :email, :password)
  end
end