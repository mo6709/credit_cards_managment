class RenamePassworDigestInUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :passwor_digest, :password_digest
  end
end
