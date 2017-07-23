class BankPartner < ActiveRecord::Base
	has_many :card_bank_partners
	has_many :cards, through: :card_bank_partners
    
    validates :name, :presence => true, :uniqueness => true

	def cards_attributes=(card_attributes)
	  	card_attributes.each do |i, attributes|
	  		if attributes[:name].present?
		  		card = Card.find_or_create_by(:name => attributes[:name])
		  		if !self.cards.include?(card)
                    attributes.each do |key, val|
                    	if key == "c_type"
                    		i_val = val.to_i
                    		card.send(("#{key}="), i_val)
                    	else
                    	    card.send(("#{key}="), val)
                        end
                    end
                    card.save
		  		    self.card_bank_partners.build(:card => card)
		  		    self.save
		  		end
	  		end
	  	end
    end

end
