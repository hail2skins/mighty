Feature: Customer creates package
  In order to give my customers a great deal
  as a business with a package created
  I can give assign that package to a customer who has paid for it

  Background: Logging in with a business
    Given I am logged in
    And I have created one business
    And I have created two customers
    And I have created one package
    Then I logout
    When I login with valid credentials

  Scenario: Adding a package to a customer from the main customer profile page
    Then I am at my business profile page
    And I expect to see a link to "Art"
    When I click the "Art" link
    Then I am at my customer show page
    And I expect to see a link to "Purchase a package?"
    When I click the "Purchase a package?" link
    
    