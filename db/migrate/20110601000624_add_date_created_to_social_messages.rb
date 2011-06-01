class AddDateCreatedToSocialMessages < ActiveRecord::Migration
  def self.up
    add_column :social_messages, :date_created, :date
  end

  def self.down
    remove_column :social_messages, :date_created
  end
end
