class AddRelationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :relation, :boolean
  end
end
