class AddTypeToBlurb < ActiveRecord::Migration
  def change
  	add_column :blurbs, :cat, :string
  end
end
