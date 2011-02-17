require "spec_helper"

describe Feedback do
  before(:each) do
    @attr = { :name => 'John Doe', :email => 'johndoe@example.com', :subject => "Subject", :message => "Message" }
  end
  
  describe "validations" do
    context "success" do
      it "should allow valid emails" do
        feedback = Feedback.new(@attr)
        feedback.save
        feedback.errors.empty?.should be_true
      end
    end
    
    context "failure" do
      it "should give an error for invaild emails" do
        feedback = Feedback.new
        feedback.save
        feedback.errors.any?.should be_true
        feedback.errors[:email][1].should =~ /email is invalid/ # Crude, but it works.
      end
    end
  end
end