class Guest
# include DataMapper::Resource
# property :id, Serial
# property :name, String
belongs_to :event
belongs_to :member
end