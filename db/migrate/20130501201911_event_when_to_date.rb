class EventWhenToDate < ActiveRecord::Migration
  def up
  	change_column :events, :when, :date
  end

  def down
  	change_column :events, :when, :datetime
  end
end
