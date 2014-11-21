class AddRankToUsers < ActiveRecord::Migration
  def up
  	add_column :users, :rank, :integer
  end

  def down
  	delete_column :users, :rank
  end
end
