class Comment
	# include DataMapper::Resource
	# property :id, Serial
	# property :content, Text
	belongs_to :post
	belongs_to :member
end