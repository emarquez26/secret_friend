class PlayController < ApplicationController
  def index
    @user_play = Relationship.new.user_player(current_user.id)
  end
end
