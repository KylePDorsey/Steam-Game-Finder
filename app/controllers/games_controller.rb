class GamesController < ApplicationController

	def index
		@games = Game.all
		@user = current_user
	end

end
