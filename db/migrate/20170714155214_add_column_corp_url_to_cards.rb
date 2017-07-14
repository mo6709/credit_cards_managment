class AddColumnCorpUrlToCards < ActiveRecord::Migration
  def change
  	add_column :cards, :corp_url, :string
  end
end
