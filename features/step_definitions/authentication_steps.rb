Given("I visit the homepage") do
  visit root_path
end

When("I fill in the sign up form") do
  click_link "Sign In"
  click_link "Sign Up"
  fill_in "user_email", :with => "tester@testdomain.test"
  fill_in "user_password", :with => "pa$$word"
  click_button "Sign up"
end

When("I confirm the email") do
  open_email("tester@testdomain.test")
  visit_in_email("Confirm my account")
end

Then("should see that my account is confirmed") do
  message = "Your email address has been successfully confirmed"
  expect(page).to have_content(message)
end

Given("I am a registered user") do
  @registered_user =
    FactoryBot.create(:user,
      email: "tester@testdomain.test",
      password: "pa$$word"
    )
end

When("I fill in the login form") do
  click_link "Sign In"
  fill_in "modal_user_email", with: "tester@testdomain.test"
  fill_in "modal_user_password", with: "pa$$word"
  click_button "Sign In"
end

Then("I should be logged in") do
  expect(page).to have_content("successfully")
end

Given("I am logged in") do
  visit root_path
  click_link "Sign In"
  fill_in "modal_user_email", with: "tester@testdomain.test"
  fill_in "modal_user_password", with: "pa$$word"
  click_button "Sign In"
end

When("I click on the log out button") do
  click_link "Sign Out"
end

Then("I should be signed out") do
  expect(page).to have_content("Signed out successfully.")
end