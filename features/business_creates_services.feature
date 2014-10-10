Feature: Business creates services
	In order to attach the services I provide my customers
	my business should have a list of services
	I can create as an owner to have available

	Background: Logging in with a business
		Given I am logged in
	  And I am at my owner profile page
	  And I have created one business

	  Scenario: Creating a service
	  	And I should see content "Services Information"
	  	And I should see content "Please tell us what types of services your business provides."
	  	And I should see a link to "Add a service your business provides now!"
	  	When I click the "Add a service your business provides now!" link
	  	Then I am at the create new service page