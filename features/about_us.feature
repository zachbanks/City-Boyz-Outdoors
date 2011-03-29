Feature: Display brief information about City Boyz Outdoors
  In order to learn more about City Boyz Outdoors
  As an user
  I want to be able to learn about City Boys Outdoors

  Scenario: About Us abstract exists
    Given I am on the about us page
    Then I should see an "About Us" section
    
  Scenario: List of team members exists
    Given I am on the about us page
    Then I should see a list of team members on City Boyz Outdoors