Feature: Create a Listing
  To contribute to the website
  As a user
  I should be able to add a listing

Scenario: Add a listing
  Given I am a registered user
  And I am logged in
  And I visit add a store sale
  When I fill out a listing form
  Then I should be able to see the listing
