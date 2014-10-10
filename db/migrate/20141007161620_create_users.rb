class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :like
      t.text :dislike

      t.timestamps
    end
  end
end
