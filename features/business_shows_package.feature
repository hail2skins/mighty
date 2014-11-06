Feature: Business shows package
  In order to see what special packages
  my business has created for my customers
  I can view a list of packages and see the details of each

  Background: Logging in with a business
    Given I am logged in
    And I have created one business
    And I have created one package
    Then I logout
    When I login with valid credentials

  Scenario: Show packages from the business profile page
    Then I am at my business profile page
    And I expect to see a link to "Packages - 1"
    When I click the "Packages - 1" link
    
