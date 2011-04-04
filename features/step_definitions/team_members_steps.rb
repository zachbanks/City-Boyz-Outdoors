Given /^I am logged in as an admin$/ do
  admin = Factory(:admin)
  #login_as_admin(admin.email, admin.password)
  #stubs(:login_as_admin).with(admin.email, admin.password).returns(admin) # TODO: Change so it actually tests login.
end

Then /^I should see a link "([^"]*)"$/ do |link_name|
  page.should have_selector 'a', :text => "#{link_name}"
end

When /^I click the link "([^"]*)"$/ do |link_name|
  click_link link_name
end

Then /^I should see a form to add new team members$/ do
  page.should have_selector '#new_team_member_form'
end