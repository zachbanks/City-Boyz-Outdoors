module ApplicationHelper
  # Returns the logo for the website.
  def logo
    image_tag("logo.jpg", :alt => "City Boyz Outdoors", :size => "300x150")
  end
end
