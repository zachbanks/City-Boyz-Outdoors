Given /^I am logged in as an admin$/ do
  admin = Factory(:admin)
  # login_as_admin(admin.email, admin.password)
  #stubs(:login_as_admin).with(admin.email, admin.password).returns(admin) # TODO: Change so it actually tests login.
end

# TODO: MAKE THIS FAIL!
Then /^I should see a link called "([^"]*)"$/ do |link_name|
  page.should have_selector 'a', :content => link_name
end