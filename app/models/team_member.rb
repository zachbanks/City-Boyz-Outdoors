class TeamMember < ActiveRecord::Base
  
  # ===============
  # = Validations =
  # ===============
  validates :name, :email, :presence => true
  
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

