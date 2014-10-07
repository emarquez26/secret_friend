class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :player1_id
      t.integer :player2_id
      t.text :like_player1
      t.text :like_player2
      t.text :dislike_player1
      t.text :dislike_player2

      t.timestamps
    end
  end
end
