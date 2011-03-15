Then /^I should see the contact us form$/ do
  page.should have_selector 'h2', :content => "Contact Us"
  page.should have_selector 'form'
end