class Card < ActiveRecord::Base
	has_many :card_bank_partners
	has_many :bank_partners, through: :card_bank_partners
	belongs_to :category
    
    # accepts_nested_attributes_for :bank_partners
    
    enum :c_type => [:personal, :business]

    validates :name, :uniqueness => true
    NON_VALIDATABLE_ATTR = ["id", "created_at", "updated_at"]
	VALIDATABLE_ATTR = self.attribute_names.reject{|attr| NON_VALIDATABLE_ATTR.include?(attr)}
	validates_presence_of VALIDATABLE_ATTR
    

    def bank_partners_attributes=(bank_partners_attributes)
		bank_partners_attributes.each do |i, attributes|
            if attributes[:name].present?
                bank_partner = BankPartner.find_or_create_by(:name => attributes[:name])
                if !self.bank_partners.include?(bank_partner)
                    self.bank_partners << bank_partner
                end
            end
		end
    end

	def self.type(c_type)
		Card.all.find_all do |card|
			card.c_type == c_type
		end
	end

end