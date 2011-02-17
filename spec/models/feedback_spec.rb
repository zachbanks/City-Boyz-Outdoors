require "spec_helper"

describe Feedback do
  before(:each) do
    @attr = { :name => 'John Doe', :email => 'johndoe@example.com', :subject => "Subject", :message => "Message" }
  end
  
  describe "validations" do
    context "success" do
      it "should allow valid emails"
    end
    
    context "failure" do
      it "should give an error for invaild emails"
    end
  end
end