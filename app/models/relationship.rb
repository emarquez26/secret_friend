class Relationship < ActiveRecord::Base
  def user_player(id)
    set_play(id)
    like1 = User.select(:like).where(id: @play)
    dislike1 = User.select(:dislike).where(id: @play)
    users_available
    unless @total==0
      @player2 = @hash_user[rand(@hash_user.length)]
      like2 = User.select(:like).where("id = ?", @player2).first.like
      dislike2 = User.select(:dislike).where("id = ?", @player2).first.dislike
      Relationship.create(player1_id: @play, player2_id: @player2, like_player1: like1, 
        dislike_player1: dislike1, like_player2: like2, dislike_player2: dislike2)
      change_relation
    end
  end

  def users_available
    @hash_user = []
    user = User.select("id").where(relation: 'false').where.not(id: @play)
    user.each{ |users| @hash_user << users.id }
    @total = user.length
  end

  def change_relation
    change_relation = { @play => { "relation" => "true" }, @player2 => { "relation" => "true" } }
    Relationship.update(change_relation.keys, change_relation.values)
  end

  def set_play(id)
    @play = id
  end
end