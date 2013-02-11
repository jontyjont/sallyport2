class Eventblog < ActiveRecord::Base
# include DataMapper::Resource
# property :id, Serial
# property :comment, Text
# timestamps :created_at
belongs_to :event
belongs_to :member
end
