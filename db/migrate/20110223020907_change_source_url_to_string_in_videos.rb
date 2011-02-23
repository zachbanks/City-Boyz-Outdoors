class ChangeSourceUrlToStringInVideos < ActiveRecord::Migration
  def self.up
    change_column :videos, :source_url, :string
  end

  def self.down
    change_column :videos, :source_url, :string
  end
end
