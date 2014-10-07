class Relationship < ActiveRecord::Base

  def list_player
    @play = User.count
    @play_rand = rand(@play - 1)
  end

  def self.player_random
    unless @array.empty?
      @play.each do
        @player=[]
        @player << User.find(:first, :limit => 1, :offset => @player_random)
      end
    end
  end
end