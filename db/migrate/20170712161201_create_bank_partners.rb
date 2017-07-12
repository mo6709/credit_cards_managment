class CreateBankPartners < ActiveRecord::Migration
  def change
    create_table :bank_partners do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
