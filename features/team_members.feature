Feature: Create new team members
  In order for users to see who is in City Boyz Outdoors
  As an administrator
  I want to be able to create team members
  
  Scenario: Shows links to add team memebers
    Given I am on the about us page
    And I am logged in as an admin
    Then I should see a link called "Add New Team Member"
  