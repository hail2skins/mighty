Feature: Customer edits visit
  In order to track my customers
  my business customers should have their visits tracked and
  I can edit visits to each of my customers to track their interaction

  Background: Logging in with a business
    Given I am logged in
    And I have created one business
    And I have created two customers
    And I have created one visit
    Then I logout
    When I login with valid credentials


  Scenario: Editing a visit from the business show page
    Then I expect to see content "Visits"
    And I expect to see a link to "1"
    When I click the "1" link
    Then I expect to see content "Edit visit for Art Mills"
    And I expect to see the title "Edit visit for Art Mills"
    And I expect to see a form to edit a visit
    And I expect to see content "Visit notes"
    And I expect to see content "Date of visit"
    When I fill in "Visit notes" with "Skin was sensitive today. Like always."
    Then I select date from date selector
    And I click the "Create Visit" button
    Then I am at my business profile page
    And I expect to see content "Total Customer Visits: 1"
    And I expect to see a link to "1"
    And I expect to see content "Visit added for Art Mills"
    When I click the "Art" link
    Then I am at my customer show page
    And I expect to see content "Last Visit: 10/24/2014"
    And I expect to see content "Total Visits:"
    And I expect to see a link to "1"

  Scenario: Creating a new visit from the customer show page
    When I click the "Art" link
    Then I am at my customer show page
    And I expect to see content "Last Visit: None Recorded"
    And I expect to see content "Total Visits:"
    And I expect to see a link to "0"
    When I click the "0" link
    Then I expect to see content "New visit for Art Mills"
    And I expect to see the title "Add a visit for Art Mills"
    And I expect to see a form to add a new visit
    And I expect to see content "Visit notes"
    And I expect to see content "Date of visit"
    When I fill in "Visit notes" with "Skin was sensitive today."
    Then I select date from date selector
    And I click the "Create Visit" button
    Then I am at my business profile page
    And I expect to see content "Total Customer Visits: 1"
    And I expect to see a link to "1"
    And I expect to see content "Visit added for Art Mills"
    When I click the "Art" link
    Then I am at my customer show page
    And I expect to see content "Last Visit: 10/24/2014"
    And I expect to see content "Total Visits:"
    And I expect to see a link to "1"






