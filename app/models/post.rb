class Post < ActiveRecord::Base
	# include DataMapper::Resource
	# property :id, Serial
	# property :title, String
	# property :content, Text
	has_many :comments
	belongs_to :member
	# timestamps :created_at
end