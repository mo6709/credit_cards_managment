class BankPartner < ActiveRecord::Base
	has_many :card_bank_partners
	has_many :cards, through: :card_bank_partners
    
    validates :name, :presence => true, :uniqueness => true
    
    attr_accessor :cards_attributes_saved 

	def cards_attributes=(card_attributes)
	  	card_attributes.each do |i, attributes|
	  		if attributes[:name].present?
		  		card = Card.find_or_create_by(:name => attributes[:name])
		  		if !self.cards.include?(card)
                    attributes.each do |key, val|
                    	if key == "c_type"
                    		int_val = val.to_i
                    		card.send(("#{key}="), int_val)
                    	else
                    	    card.send(("#{key}="), val)
                        end
                    end
                    if card.save
			  		    #self.card_bank_partners.build(:card => card)
			  		    #self.save
			  		    #self.cards_attributes_saved = true
			  		    self.cards << card
		  		    else
                        self.cards_attributes_saved = false
		  		    end  
		  		end
	  		end
	  	end
    end

end
