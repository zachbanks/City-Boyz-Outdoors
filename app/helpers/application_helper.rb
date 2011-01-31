module ApplicationHelper
  # Returns the logo for the website.
  def logo
    image_tag("logo.png", :alt => "City Boyz Outdoors")
  end
end
