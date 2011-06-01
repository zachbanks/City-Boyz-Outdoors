class AddPhotoUrlToTeamMembers < ActiveRecord::Migration
  def self.up
    add_column :team_members, :photo_url, :string
  end

  def self.down
    remove_column :team_members, :photo_url
  end
end
