class AddUidAndImageToUsers < ActiveRecord::Migration
  def change
    add_column(:users, :uid, :float)
    add_column(:users, :image, :string)
  end
end
