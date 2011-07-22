class AddAuthTokenToAdmins < ActiveRecord::Migration
  def self.up
    add_column :admins, :auth_token, :string
  end

  def self.down
    remove_column :admins, :auth_token
  end
end
