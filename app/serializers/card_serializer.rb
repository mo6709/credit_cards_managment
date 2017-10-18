class CardSerializer < ActiveModel::Serializer
  attributes :id, :name, :c_type, :bonus, :apr, :anual_fee, :credit_needed, :balance_transfer_apr, :corp_url, :balance_transfer_period
  belongs_to :category
  has_many :bank_partners, serializer: CardBankPartnersSerializer
end
