class PagesController < ApplicationController

  def home
    @title = "Home"
  end

  def about
    @title = "About"
  end

  def media
    @title = "Media"
  end

end
