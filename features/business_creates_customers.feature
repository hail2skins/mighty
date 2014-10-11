Feature: Business creates customers
	In order to conduct business
	my business should be able to add customers
	I can create as an owner of the business

	Background: Logging in with a business
		Given I am logged in
	  And I am at my owner profile page
	  And I have created one business

	  Scenario: Creating first customer
	  	Then I expect to see content "Customer Information"
	  	And I expect to see content "You have not yet added any customers."
	  	And I expect to see a link to "Add a customer for your business now!"
	  	When I click the "Add a customer for your business now!" link
	  	Then I am at the create new customer page
	  	And I expect to see a form to add customer information
	  	And I expect to see the title "Create a customer"
	  	When I fill in "First name" with "Kathy"
	  	And I fill in "Middle name" with ""
	  	And I fill in "Last name" with "Davis"
	  	And I fill in "Email" with "test@test.com"
	  	And I fill in "Phone number" with "651.555.1212"
	  	And I fill in "Referred by" with ""
	  	When I click the "Save Customer" button
	  	Then I expect to see content "This customer has been created."
	  	And I am at my owner profile page
	  	Then I expect to see content "Customer Information"
	  	But I expect to not see content "You have not yet added any customers."
	  	Then I expect to see a link to "Customers"
	  	And I expect to see a link to "Add"
	  	And I expect to see content "Customers = 1"
	  	And I expect to see a link to "Add customers"