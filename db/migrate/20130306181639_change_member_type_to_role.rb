class ChangeMemberTypeToRole < ActiveRecord::Migration
  def change
  	rename_column :members, :type, :role
  end
end
