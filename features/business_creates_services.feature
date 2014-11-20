Feature: Business creates services
	In order to attach the services I provide my customers
	my business should have a list of services
	I can create as an owner to have available

	Background: Logging in with a business
	  Given I am logged in
	  And I have created one business
	  And I have created two customers
    Then I logout
    When I login with valid credentials

	  Scenario: Creating a service
	    Then I am at my business profile page
	  	And I expect to see content "Services Information"
	  	And I expect to see content "Please tell us what types of services your business provides."
	  	And I should see a link to "Add a service your business provides now!"
	  	When I click the "Add a service your business provides now!" link
	  	Then I expect to see the title "Add a service"
	  	And I expect to see content "Add a service"
	  	And I expect to see a form to add a new service
	  	And I expect to see content "Service name"
	  	And I expect to see content "Description"
	  	And I expect to see content "Price"
	  	And I expect to see a link to "Back to main business page"
	  	
