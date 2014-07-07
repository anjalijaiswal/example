class User < ActiveRecord::Base
	has_many :drugs, :through => :user_medications
	has_many :user_medications
	   validates :name,    :presence => true
	   validates :address, :presence => true
	   validates :email,   :presence => true, :uniqueness => true, on: :login
	   validates :password,:presence => true,                      on: :login
	   validates :phone,   :presence => true
	   validates :age,     :presence => true
   # validates :type,    :presence => true
   validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
