class Video < ActiveRecord::Base
  attr_accessible :title, :source_url
  
  validates :title, :source_url, :presence => true

  private

  def format_url
    # Parse given html code into useable data.    
  end

end
