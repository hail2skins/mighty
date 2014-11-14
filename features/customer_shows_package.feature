Feature: Customer shows package
  In order to track special deals my customers have
  as a business with a package created and a customer who has purchased a deal
  I can view a list of all purchased deals and each individual deal

  Background: Logging in with a business
    Given I am logged in
    And I have created one business
    And I have created two customers
    And I have created one package
    And I have created one deal
    Then I logout
    When I login with valid credentials
    Then I am at my business profile page
    And I expect to see a link to "Art"
    When I click the "Art" link
    Then I am at my customer show page
    And I expect to see a link to "Packages in progress: 1"
    And I expect to see a link to "Purchase another package?"


  Scenario: Adding a package to a customer from the main customer profile page

    When I select date from "deal" date selector
    And I select "First Customer Package" from "Package"
    And I click the "Create Deal" button
    Then I am at my customer show page
    And I expect to see content "Package purchased for Art Mills"
    
  Scenario: Adding a package with validations
    When I click the "Create Deal" button
    Then I expect to see content "2 errors prohibited this package deal from being saved:"
    And I expect to see content "Date purchased can't be blank"
    And I expect to see content "Package can't be blank"