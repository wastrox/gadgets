Feature: Manage Gadgets
	In order to manage my gadgets collection
	As a registered user
	I want to create and manage gadgets

	Scenario: Gadgets List
		Given I have gadgets titled iPhone, iPad
		When I go to the list of gadgets
		Then I should see "iPhone"
		And I should see "iPad"