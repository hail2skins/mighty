Feature: Business creates package
  In order to provide value for customers
  my business should have a special package
  I can create and allow my customers to purchase

  Background: Logging in with a business
    Given I am logged in
    And I have created one business
    Then I logout
    When I login with valid credentials

  Scenario: Create a new package
    Then I am at my business profile page
    And I expect to see a link to "Add new package"
    When I click the "Add new package" link
    Then I expect to see the title "Add new package"
    And I expect to see content "Build your special package"
    And I expect to see a form to add package
    And I expect to see content "Package Name"
    And I expect to see content "Description"
    And I expect to see content "Number of visits in package"
    And I expect to see content "Date purchased"
    When I fill in "Package Name" with "Large Package"
    And I fill in "Descrption" with "Package for customers buying a larger package."
    And I fill in "Number of visits in package" with "6"
    And I select date from date selector
    When I click the "Create Package" button
    Then I am at my business profile page
    And I expect to see a link to "Packages - 1"
    But I do not expect to a link to "Add new package"
    