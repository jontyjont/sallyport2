class BackupMembersPassword < ActiveRecord::Migration
  def up
  	rename_column :members, :password, :password_bak
  end


  def down
  	rename_column :members, :password_bak, :password
  end
end
