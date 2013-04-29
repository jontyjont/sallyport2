class RemoveUnwanted < ActiveRecord::Migration
  def up
  	drop_table :events
  	drop_table :eventblogs
  	drop_table :comments
  	drop_table :goings
  	drop_table :guests
  	drop_table :posts
  end

  def down
  end
end
