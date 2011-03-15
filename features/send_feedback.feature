Feature: Send feedback to site administrators
  In order to send feedback to site administrators
  As an user
  I want to be able to send them feedback
  
  Scenario: Contact Us form exists
    Given I am on the contact us page
    Then I should see the contact us form
    
  Scenario: Send feedback
    Given I am on the contact us page
    When I fill in the contact us form
    And I press "Submit"
    Then my message will be sent to the site administrators