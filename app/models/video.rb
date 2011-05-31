class Video < ActiveRecord::Base
  attr_accessible :title, :description, :source_url, :permalink, :thumbnail_url
  
  validates :title, :description, :presence => true
  validates :source_url, 
            :presence => { :message => "Source url cannot be blank and must be a valid url." },
            :format => { :with => /http:\/\/.*/ }
             # TODO Make regex better.
  
  default_scope :order => 'videos.created_at DESC'
  
  before_save :create_permalink
  before_save :get_vimeo_video_thumbnail
  
  def to_param
    "#{id}-#{permalink}"
  end
  
  def to_s
    title
  end
  
  private
  
  def create_permalink
    unless permalink == title.parameterize
      self.permalink = "#{title.parameterize}"
    else
      permalink
    end
  end
  
  def get_vimeo_video_thumbnail(size="large")
    url = source_url
    vimeo_video_id = url.scan(/vimeo.com\/video\/(\d+)\/?/).flatten.first.to_s # Extract the video id.
    vimeo_video_json_url = "http://vimeo.com/api/v2/video/#{vimeo_video_id}.json" # API call
    
    # Parse the JSON and extract the thumbnail_large url
    self.thumbnail_url = JSON.parse(open(vimeo_video_json_url).read).first["thumbnail_#{size}"] rescue nil
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

