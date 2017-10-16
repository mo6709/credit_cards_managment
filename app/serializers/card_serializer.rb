class CardSerializer < ActiveModel::Serializer
  attributes :name, :c_type, :bonus, :apr, :anual_fee, :credit_needed, :balance_transfer_apr 
  belongs_to :category
  has_many :bank_partners, serializer: CardBankPartnersSerializer
end
