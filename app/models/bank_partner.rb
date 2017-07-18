class BankPartner < ActiveRecord::Base
	has_many :card_bank_partners
	has_many :cards, through: :card_bank_partners

	def cards_attributes=(card_attributes)
	  	card_attributes.each do |i, attributes|
	  		if attributes[:name].present?
		  		card = Card.find_or_create_by(:name => attributes[:name])
		  		if !self.cards.include?(card)
		  		    self.card_bank_partners.build(:card => card)
		  		    self.save
		  		end
	  		end
	  	end
    end

end
