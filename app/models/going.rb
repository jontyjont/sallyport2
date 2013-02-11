class Going < ActiveRecord::Base
# include DataMapper::Resource
# property :id, Serial
# property :status, String
belongs_to :member
belongs_to :event
end