class Video < ActiveRecord::Base
  attr_accessible :title, :description, :source_url, :permalink
  
  validates :title, :description, :presence => true
  validates :source_url, 
            :presence => true, 
            :format => { :with => /http:\/\/.*/ }
            # :message => "Source url cannot be blank and must be a valid url." # TODO Make regex better.
  
  default_scope :order => 'videos.created_at DESC'
  
  before_save :create_permalink
  
  def to_param
    "#{id}-#{permalink}"
  end
  
  private
  
  def create_permalink
    unless permalink == title.parameterize
      self.permalink = "#{title.parameterize}"
    else
      permalink
    end
  end
  
end



# == Schema Information
#
# Table name: videos
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  source_url  :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
#  permalink   :string(255)
#

