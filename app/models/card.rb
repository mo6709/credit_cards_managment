class Card < ActiveRecord::Base
	has_many :card_bank_partners
	has_many :bank_partners, :through => :card_bank_partners
	belongs_to :category

	enum :type => [:personal, :business]

	def self.type(c_type)
		Card.all.map do |card|
			card.type == c_type
		end
	end
end
