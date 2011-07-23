class AddPasswordResetToAdmins < ActiveRecord::Migration
  def self.up
    add_column :admins, :password_reset_token, :string
    add_column :admins, :password_reset_sent, :datetime
  end

  def self.down
    remove_column :admins, :password_reset_sent
    remove_column :admins, :password_reset_token
  end
end
