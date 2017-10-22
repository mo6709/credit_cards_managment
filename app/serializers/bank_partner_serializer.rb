class BankPartnerSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :cards, Serializer: CardSerializer 
end
