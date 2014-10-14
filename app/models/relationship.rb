class Relationship < ActiveRecord::Base
  def user_player(id)
    my_data(id)
    users_available
    unless @total==0 and @my_dates.relation == "t"
      @player2 = @hash_user[rand(@hash_user.length)]
      
      @dates_player2 = User.find(@player2)
      save_relation = Relationship.new({
        :player1_id => @my_id, :player2_id => @player2,
        :like_player1 => @my_dates.like, :like_player2 => @dates_player2.like,
        :dislike_player1 => @my_dates.relation, :dislike_player2 => @dates_player2.dislike
      })
      save_relation.save
      change_relation
    end
  end

  def my_data(id)
    @my_id = id
    @my_dates = User.find(@my_id)
  end

  def users_available
    @hash_user = []
    user = User.select("id").where(relation: 'false').where.not(id: @my_id)
    user.each{ |users| @hash_user << users.id }
    @total = user.length
  end

  def change_relation
    change_relation = { @my_id => { "relation" => "true" }, @player2 => { "relation" => "true" } }
    User.update(change_relation.keys, change_relation.values)
  end
end