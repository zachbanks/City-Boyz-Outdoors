# require File.dirname(__FILE__) + '/../spec_helper'
# 
# describe SessionsController do
#   render_views
# 
#   it "new action should render new template" do
#     get :new
#     response.should render_template(:new)
#   end
# 
#   it "create action should render new template when authentication is invalid" do
#     Admin.stubs(:authenticate).returns(nil)
#     post :create
#     response.should render_template(:new)
#     session['admin_id'].should be_nil
#   end
# 
#   it "create action should redirect when authentication is valid" do
#     Admin.stubs(:authenticate).returns(Admin.first)
#     post :create
#     response.should redirect_to(root_url)
#     session['admin_id'].should == Admin.first.id
#   end
# end
