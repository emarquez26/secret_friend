class PlayController < ApplicationController
  def play
    @user_play = Player.new.play(current_user.id)
  end
end
