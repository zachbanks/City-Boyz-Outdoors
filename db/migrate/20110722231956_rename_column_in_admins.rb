class RenameColumnInAdmins < ActiveRecord::Migration
  def self.up
    rename_column :admins, :password_reset_sent, :password_reset_sent_at
  end

  def self.down
    rename_column :admins, :password_reset_sent_at, :password_reset_sent
  end
end
