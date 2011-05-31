class TeamMember < ActiveRecord::Base
  
  attr_accessible :name, :email, :bio, :photo_url
  
  before_save :assign_photo
  
  # ===============
  # = Validations =
  # ===============
  validates :name, :email, :presence => true
  validates :email, :format => { :with => $EMAIL_REGEX }
  
  
  def to_s
    name
  end
  
  def assign_photo
    if photo_url.blank?
      self.photo_url = "http://i1200.photobucket.com/albums/bb328/cityboyzoutdoors/Team%20Member%20Photos/no-profile-man-medium.jpg" # Stock image.
    end
  end
  
end


# == Schema Information
#
# Table name: team_members
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  bio        :text
#  created_at :datetime
#  updated_at :datetime
#  photo_url  :string(255)
#

