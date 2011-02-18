module ApplicationHelper
  # Returns the title for a given page.
  def title
    base_title = "City Boyz Outdoors"
    unless @title
      base_title
    else
      "#{base_title} | #@title"
    end
  end
  
  # Returns the logo for the website.
  def logo
    image_tag("logo.png", :alt => "City Boyz Outdoors", :size => "300x150")
  end
  
  # Returns the Facebook logo.
  def facebook_logo
    image_tag("icons/facebook_logo.png", :alt => "Check us out on Facebook!", :size => "50x50")
  end
  
  # Returns the Twitter logo.
  def twitter_logo
    image_tag("icons/twitter_logo.png", :alt => "Follow us on Twitter!", :size => "50x50")
  end
  
end
