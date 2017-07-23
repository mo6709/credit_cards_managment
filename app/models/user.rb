class User < ActiveRecord::Base
	has_many :accounts
	has_many :cards, :through => :accounts
	has_secure_password

    validates :email, :presence => true, :uniqueness => true
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
    validates :name, :presence => true

    validates :password, :length => { :minimum => 7 }
    validates :password, :confirmation => true

    def self.find_or_create_by_omniauth(auth_hash)
    	self.where(:email => auth_hash[:info][:email]).first_or_create do |user|
    		user.uid = auth_hash[:uid]
    		user.name = auth_hash[:info][:name]
    		user.email = auth_hash[:info][:email]
    		user.image = auth_hash[:info][:image]

    		random_password = Random.new_seed
    		user.password = random_password
    		user.password_confirmation = random_password
    	end
    end
end
