require 'spec_helper'

describe PagesController do
  render_views
  
  describe "GET 'home'" do
    
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    it "should have the correct title" do
      get :home
      response.should have_selector('title', :content => "City Boyz Outdoors | Home")
    end
    
  end

  describe "GET 'about'" do
    
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    
    it "should have the correct title" do
      get :about
      response.should have_selector('title', :content => "City Boyz Outdoors | About")
    end
    
  end

  describe "GET 'media'" do
    
    it "should be successful" do
      get 'media'
      response.should be_success
    end

    it "should have the correct title" do
      get :media
      response.should have_selector 'title', :content => "City Boyz Outdoors | Media"
    end

  end
  
end
