class ChanceColumnBankePartenrIdInCardBankPartners < ActiveRecord::Migration
  def change
    rename_column :card_bank_partners, :bank_partenr_id, :bank_partner_id
  end
end
