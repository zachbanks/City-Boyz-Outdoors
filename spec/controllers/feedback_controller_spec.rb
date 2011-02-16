require "spec_helper"

describe FeedbackController do
  render_views
  
  describe "GET 'new'" do
    
    it "should be successful" do
      get :new
      response.should be_success
    end
    
    it "should have the correct title" do
      get :new
      response.should have_selector('title', :content => "City Boyz Outdoors | Contact")
    end
    
  end
  
  # TODO: Get tests working!
  describe "POST 'create'" do
    context "success" do
      
      before(:each) do
        @feedback_attrs = { :name => "John Doe", :email => "john@example.com", :subject => "Message Subject", :message => "Message" }
      end
      
      it "should be successful" do
        post :create, :feedback => @feedback_attrs
        response.should be_success
      end
      
      it "should have the correct title" do
        post :create, :feedback => @feedback_attrs
        response.should have_selector 'title', :content => "City Boyz Outdoors | Contact"
      end
      
      it "should redirect to contact_path" do
        post :create, :feedback => @feedback_attrs
        response.should redirect_to contact_path
      end
      
      it "should have a flash message confirming success" do
        post :create, :feedback => @feedback_attrs
        flash[:notice].should == 'Thanks for your message! We will be in touch shortly!'
      end
      
    end
  end
  
end