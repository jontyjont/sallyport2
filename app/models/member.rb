class Member < ActiveRecord::Base
# include DataMapper::Resource
# property :id, Serial
# property :fname, String
# property :sname, String
# property :email, String
# property :phone, String
# property :mobile, String
# property :username, String
# property :password, String
# property :type, String now role
has_many :comments
has_many :posts
has_many :guests
has_many :goings
has_many :events, :through => :goings
has_many :eventblogs

def self.admin
	where(:role => 'admin')
end

def self.admin_emails
	Member.admin.all.map(&:email)
end


end