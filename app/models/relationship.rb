class Relationship < ActiveRecord::Base
  def user_player(current_user)
    @current_user = current_user
    users_available
    if @total > 0 and @current_user.relation == false
      @player2 = @hash_user[rand(@hash_user.length)]
      @dates_player2 = User.find(@player2)

      User.change_relation @current_user.id, @player2
      
      save_relation = Relationship.create(
        :player1_id => @current_user.id, :player2_id => @player2,
        :like_player1 => @current_user.like, :like_player2 => @dates_player2.like,
        :dislike_player1 => @current_user.relation, :dislike_player2 => @dates_player2.dislike
      )
      @dates_player2
    end
  end

  def users_available
    @hash_user = []
    user = User.users_available @current_user.id
    user.each{ |users| @hash_user << users.id }
    @total = user.length
  end
end