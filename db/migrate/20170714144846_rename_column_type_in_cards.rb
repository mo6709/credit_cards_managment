class RenameColumnTypeInCards < ActiveRecord::Migration
  def change
  	rename_column :cards, :type, :c_type
  end
end
