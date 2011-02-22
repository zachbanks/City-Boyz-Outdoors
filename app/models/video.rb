class Video < ActiveRecord::Base
  attr_accessible :title, :source_url
  
  private

  def format_url
    
  end

end
