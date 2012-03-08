Feature: sample

	Scenario: To verify the fields of sample
	Given I am in sample page
	Then I should see "My Blog"
	Then I should see "Title"
	Then I should see "Description"
	Then I should see "Price"
	
	Scenario: To verify the fields of sample with empty
	Given I am in sample page
	Then I fill in "Title" with ""
	Then I fill in "Description" with ""
	Then I fill in "Price" with ""
	When I press "Create Sample"
	Then I should see "3 errors prohibited this sample from being saved:"
	
	Scenario: To verify the fields of sample with values
	Given I am in sample page
	Then I fill in "Title" with "sfefwr"
	Then I fill in "Description" with "regrehgerhrehfhd"
	Then I fill in "Price" with "235236"
	When I press "Create Sample"
	Then I should see "Sample was successfully created"
	
	Scenario: To verify the fields of sample with wrong values1
	Given I am in sample page
	Then I fill in "Title" with "sfefwr"
	Then I fill in "Description" with "regrehdgrejht"
	Then I fill in "Price" with "hsvcygv"
	When I press "Create Sample"
	Then I should see "Price cant be string/special character"
	
	Scenario: To verify the fields of sample with wrong values2
	Given I am in sample page
	Then I fill in "Title" with "sfefwr"
	Then I fill in "Description" with "regreh"
	Then I fill in "Price" with "21413546"
	When I press "Create Sample"
	Then I should see "Description should be greater than 10 and less than 100"
	
	Scenario: To verify the links
	Given I am in sample page
	When I follow "Back"
