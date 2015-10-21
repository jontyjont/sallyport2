class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
 #:confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable,   
         :recoverable, :rememberable  #:secure_validatable,


  # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :password, :password_confirmation, :remember_me
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



def self.admin
	where(:role => 'admin')
end

def self.admin_emails
	Member.admin.all.map(&:email)
end

def is_admin?
	self.role == "admin"
end

end