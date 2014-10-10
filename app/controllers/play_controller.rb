class PlayController < ApplicationController
  def play
    @user_play = Relationship.new.user_player(current_user.id)
  end
end
