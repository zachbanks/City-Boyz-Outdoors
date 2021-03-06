require "spec_helper"

describe "LayoutLinks" do
  
  it "should have homepage at '/'" do
    get '/'
    response.should have_selector 'title', :content => "Home"
  end
  
  it "should have a Contact Page at '/contact'" do
    get '/contact'
    response.should have_selector 'title', :content => "Contact"
  end
  
  it "should have an About Page at '/about'" do
    get '/about'
    response.should have_selector 'title', :content => "About"
  end
  
  it "should redirect to homepage when logo is clicked" do
    visit root_path
    response.should have_selector 'a[href="/"] > img'
  end
  
  # Test to make sure all links on site are working.
  it "should have the correct links on the layout" do
    visit root_path
    response.should have_selector 'title', :content => "Home"
    click_link "About"
    response.should have_selector 'title', :content => "About"
    click_link "Contact"
    response.should have_selector 'title', :content => "Contact"
  end
  
end