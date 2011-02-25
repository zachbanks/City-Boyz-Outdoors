require 'spec_helper'

describe VideosController do
  render_views
  let(:video) { Factory :video }
  let(:admin) { Factory :admin }

  describe "GET index"  do
    
    it "should be successful" do
      get :index
      response.should be_success
    end

    it "should have the correct title" do
      get :index
      response.should have_selector 'title', :content => 'City Boyz Outdoors | Videos'
    end

  end

  describe "GET new" do
   
   context "requires login" do
     before(:each) do
       login_as_admin(admin.email, admin.password)
     end
     it "should be successful" do
       get :new
       response.should be_success
     end

     it "should have the correct title" do
       get :new
       response.should have_selector 'title', :content => 'City Boyz Outdoors | New Video'
     end
   end
   
   context "does not require login" do
     it "should deny access to anyone not signed in as admin" do
       get :new
       flash[:alert].should_not be_nil
       response.should redirect_to login_path
     end
   end

  end

  describe "POST create" do
    
  end

end
