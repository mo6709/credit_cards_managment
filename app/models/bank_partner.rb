class BankPartner < ActiveRecord::Base
	has_many :card_bank_partners
	has_many :cards, :through => :card_bank_partners
end
