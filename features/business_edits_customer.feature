Feature: Business edits customers
	In order to keep my business customers updated
	As a business owner who wants to keep information up to date
	I can edit customer information

	Background: Logging in with a business
	  Given I am logged in
	  And I have created one business
	  And I have created two customers
    Then I logout
    When I login with valid credentials
	
	  Scenario: Showing customers
	  	And I expect to see a link to "Customers"
	  	And I expect to see a link to "Art"
	  	When I click the "Art" link
	  	Then I expect to see a link to "Edit Customer"
	  	When I click the "Edit Customer" link
	  	Then I expect to see the title "Edit Art Mills"
	  	And I expect to see a form to edit information
	  	And I fill in "First name" with "Arthur"
	  	And I fill in "Middle name" with "Raphael"
	  	And I fill in "Last name" with "Miller"
	  	And I fill in "Email" with "test@test.com"
	  	And I fill in "Phone" with "651.555.1212"
	  	And I fill in "Referred by" with "Rebecca Looney"
	  	And I click the "Update" button
	  	Then I expect to see content "This customer's information has been updated."

