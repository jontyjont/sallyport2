class Event < ActiveRecord::Base
# include DataMapper::Resource
# property :id, Serial
# property :name, String
# property :where, String
# property :wherelink, String
# property :when, Date
# property :start, String
# property :duration, String
# property :description, Text
# property :report, Text
# property :eventlink, String
# property :confirmed, String ,:default=>'maybe'
has_many :eventblogs
has_many :guests
has_many :goings
has_many :members , :through => :goings

 end