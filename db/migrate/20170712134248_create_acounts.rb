class CreateAcounts < ActiveRecord::Migration
  def change
    create_table :acounts do |t|
      t.string :account_number
      t.integer :user_id
      t.integer :card_id
      t.integer :credit_line
      t.datetime :due_date
      t.datetime :open_date

      t.timestamps null: false
    end
  end
end
