class User < ActiveRecord::Base
	has_many :accounts
	has_many :cards, :through => :accounts
	has_secure_password
end
