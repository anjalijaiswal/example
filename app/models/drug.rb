class Drug < ActiveRecord::Base
	has_many :users, :through => :user_medications
	has_many :user_medications
end
