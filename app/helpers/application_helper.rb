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
    image_tag("logo.jpg", :alt => "City Boyz Outdoors", :size => "300x150")
  end
end
