class Card < ActiveRecord::Base
	has_many :card_bank_partners
	has_many :bank_partners, :through => :card_bank_partners
	belongs_to :category

	enum :c_type => [:personal, :business]

	def self.type(c_type)
		Card.all.find_all do |card|
			card.c_type == c_type
		end
	end
end
