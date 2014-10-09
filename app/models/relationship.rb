class Relationship < ActiveRecord::Base
  def user_player(id)
    @play = id
    like1 = User.select(:like).where(id: @play)
    dislike1 = User.select(:dislike).where(id: @play)
    if users_available
      player2 = @hash_user[rand(@hash_user.length)]
      like2 = User.select(:like).where("id = ?", player2).first.like
      dislike2 = User.select(:dislike).where("id = ?", player2).first.dislike
      Relationship.create(player1_id: @play, player2_id: player2, like_player1: like, 
        dislike_player1: dislike1, like_player2: like2, dislike_player2: dislike2)
      User.update(relation: 'true').where("id = ?", @play).first.id
      User.update(relation: 'true').where("id = ?", player2).first.id
    end
  end

  def users_available
    @hash_user = []
    user = User.select("id").where(relation: 'false')where.not(id: @play)
    user.each{ |users| @hash_user << users.id }
    total = user.length
  end
end