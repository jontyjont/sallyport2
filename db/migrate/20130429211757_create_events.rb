class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :what
      t.datetime :when
      t.string :where
      t.string :yes
      t.string :no
      t.string :dk
      t.string :prob
      t.string :type

      t.timestamps
    end
  end
end
