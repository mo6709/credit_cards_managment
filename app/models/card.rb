class Card < ActiveRecord::Base
	has_many :card_bank_partners
	has_many :bank_partners, through: :card_bank_partners
	belongs_to :category
    
    validates :name, :uniqueness => true
    NON_VALIDATABLE_ATTR = ["id", "created_at", "updated_at"]
	VALIDATABLE_ATTR = self.attribute_names.reject{|attr| NON_VALIDATABLE_ATTR.include?(attr)}
	validates_presence_of VALIDATABLE_ATTR


	enum :c_type => [:personal, :business]

	def self.type(c_type)
		Card.all.find_all do |card|
			card.c_type == c_type
		end
	end

end
