class RenameDateCreatedToDatePostedInSocialMessages < ActiveRecord::Migration
  def self.up
    rename_column :social_messages, :date_created, :date_posted
  end

  def self.down
    rename_column :social_messages, :date_posted, :date_created
  end
end
