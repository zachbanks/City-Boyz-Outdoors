Then /^I should see the contact us form$/ do
  page.should have_selector 'h2', :content => "Contact Us"
  page.should have_selector 'form'
end

When /^I fill in the contact us form$/ do
  fill_in "Name", :with => "John Doe"
  fill_in "Email", :with => "johndoe@example.com"
  fill_in "Subject", :with => "My Subject"
  fill_in "Message", :with => "My Message"
end

Then /^my message will be sent to the site administrators$/ do
  page.should have_selector '.flash'
end