require "spec_helper"

describe "contact us form" do
  describe "success" do
    it "should allow email to be sent" do
      visit contact_path
      fill_in "Name", :with => "John Doe"
      fill_in "Email", :with => "johndoe@example.com"
      fill_in "Subject", :with => "My Subject"
      fill_in "Message", :with => "My Message."
      click_button
      response.should have_selector '.flash'
    end
  end
  describe "failure" do
    it "should have validation errors" do
      visit contact_path
      fill_in "Name", :with => ""
      fill_in "Email", :with => ""
      fill_in "Subject", :with => ""
      fill_in "Message", :with => ""
      click_button
      response.should render_template 'feedback/new'
      response.should have_selector 'div#error_explanation'
    end
  end
end