class Relationship < ActiveRecord::Base

  def user_player(id)
    @play = id
    return false if user_available.empty?
    player2 = user_available
    player2 = player2[rand(player2.length)]
    Relationship.create(player1_id: @play, player2_id: player2)
  end

  def user_available
    @hash_user = []
    user = User.select("id").where(relation: 'false')
    user.each{ |users| @hash_user << users.id }
    total = user.length
  end
end