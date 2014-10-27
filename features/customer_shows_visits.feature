Feature: Customer shows visits
  In order to track my customers
  my business customers should have their visits tracked and
  I can add visits to each of my customers to track their interaction

  Background: Logging in with a business
    Given I am logged in
    And I have created one business
    And I have created two customers
    And I have created a visit for each customer
    Then I logout
    When I login with valid credentials

  Scenario: Viewing most recent visit from customer show page
    Then I expect to see a link to "Art"
    And I expect to see a link to "David"
    When I click the "Art" link
    Then I am at my customer show page
    And I expect to see content "Last Visit"
    And I expect to see a link to "10/24/2014"
    When I click the "10/24/2014" link
    Then I expect to see the title "View visit for Art Mills"
    And I expect to see content "I'm Art's customer and my skin is sensitive"
    And I expect to see a link to "Return to customer page"
    And I expect to see a link to "Return to main business page"
    And I expect to see a link to "Add a new visit"