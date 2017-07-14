class RenameColumnBalanceTrancferAprInCards < ActiveRecord::Migration
  def change
  	rename_column :cards, :balance_trancfer_apr,  :balance_transfer_apr
  end
end
