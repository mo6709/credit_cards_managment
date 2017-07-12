class CardBankPartner < ActiveRecord::Base
	belongs_to :bank_partner
	belongs_to :card
end
