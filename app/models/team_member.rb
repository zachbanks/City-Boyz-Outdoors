class TeamMember < ActiveRecord::Base
  
  attr_accessible :name, :email, :bio
  
  # ===============
  # = Validations =
  # ===============
  validates :name, :email, :presence => true
  validates :email, :format => { :with => $EMAIL_REGEX }
  
  
  def to_s
    name
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
#

