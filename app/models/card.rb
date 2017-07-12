class Card < ActiveRecord::Base
	has_many :card_bank_partners
	has_many :bank_partners, :through => :card_bank_partners
	belongs_to :category
end
