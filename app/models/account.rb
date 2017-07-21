class Account < ActiveRecord::Base
	belongs_to :user
	belongs_to :card
	validates :account_number, :uniqueness => true

	NON_VALIDATABLE_ATTR = ["id", "created_at", "updated_at"]
	VALIDATABLE_ATTR = self.attribute_names.reject{|attr| NON_VALIDATABLE_ATTR.include?(attr)}
	validates_presence_of VALIDATABLE_ATTR
end
