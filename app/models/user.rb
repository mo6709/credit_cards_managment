class User < ActiveRecord::Base
	has_many :accounts
	has_many :cards, :through => :accounts
	has_secure_password

    validates :email, :presence => true
    validates :name, :presence => true
    validates :password, :length => { :minimum => 7 }
    validates :password, :confirmation => true
end
