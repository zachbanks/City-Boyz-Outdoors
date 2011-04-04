Then /^I should see an "([^"]*)" section$/ do |section|
  page.should have_selector 'h2', :content => section
end

Then /^I should see a list of team members on City Boyz Outdoors$/ do
  page.should have_selector 'ul#team_members'
end