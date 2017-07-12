class CreateCardBankPartners < ActiveRecord::Migration
  def change
    create_table :card_bank_partners do |t|
      t.integer :card_id
      t.integer :bank_partenr_id

      t.timestamps null: false
    end

    add_index :card_bank_partners, [:card_id, :bank_partenr_id], :unique => true, :name => "by_card_bank_partner"
  end
end
