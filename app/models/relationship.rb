class Relationship < ActiveRecord::Base
  def user_player(current_user)
    @current_user = current_user
    users_available
    if @total_users_available > 0 and @current_user.relation == false
      @player2 = @hash_users_available[rand(@hash_users_available.length)]
      @dates_player2 = User.find(@player2)

      User.change_relation @current_user.id, @player2
      
      save_relation = Relationship.create(
        :player1_id => @current_user.id, :player2_id => @player2,
        :like_player1 => @current_user.like, :like_player2 => @dates_player2.like,
        :dislike_player1 => @current_user.relation, :dislike_player2 => @dates_player2.dislike
      )
      @dates_player2
    else
      User.enviarCorreo
    end
  end

  def users_available
    @hash_users_available = []
    user_available_to_play = User.users_available @current_user.id
    user_available_to_play.each{ |users| @hash_users_available << users.id }
    @total_users_available = user_available_to_play.length
  end
end