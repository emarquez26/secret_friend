class PlayController < ApplicationController
	before_action :authenticate_user!
  def user_player
    @user = Player.new.play(current_user.id)
  end
end
