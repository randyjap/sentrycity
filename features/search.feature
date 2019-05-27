Feature: Authentication
  In order to use the website
  As a user
  I should be able to search listings

Scenario: Search listings
  Given There is a listing
  And I start a search
  Then I should be able to see that listing

Scenario: See a listing
  Given I am a registered user
  And I am logged in
  And I visit a listing
  Then I should see the listing details

Scenario: Not see a listing when not logged in
  Given I am not logged in
  And I visit a listing
  Then I should be redirected to the login page