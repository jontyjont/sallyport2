class AddPwordChangedAtToMember < ActiveRecord::Migration
  def change
  	add_column :members, :password_changed_at, :datetime
  	add_index :members, :password_changed_at
  end
end
