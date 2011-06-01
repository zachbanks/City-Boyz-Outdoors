class SocialMessage < ActiveRecord::Base
  attr_accessible :body, :source, :date_posted
  
end


# == Schema Information
#
# Table name: social_messages
#
#  id          :integer         not null, primary key
#  body        :text
#  source      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  date_posted :date
#

