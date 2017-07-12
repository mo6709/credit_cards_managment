class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :type
      t.text :bonus
      t.string :apr
      t.integer :anual_fee
      t.string :credit_needed
      t.integer :balance_trancfer_apr
      t.integer :balance_transfer_period

      t.timestamps null: false
    end
  end
end
