store_name = 'Great Sale Store'

Given("There is a listing") do
  FactoryBot.create(:store, name: store_name, state: 'active', event_date: Time.now, event_type: "Grand Opening")
end

When("I start a search") do
  visit s_path
  fill_in "form_search", :with => "Gr"
  click_button "Kazaam"
end

Then("I should be able to see that listing") do
  expect(page).to have_content(store_name)
end

Given("I visit a listing") do
  store = FactoryBot.create(:store, name: store_name, state: 'active', event_date: Time.now, event_type: "Grand Opening")
  visit store_path(store)
end

Then("I should see the listing details") do
  message = 'Opening Hours'
  expect(page).to have_content(store_name)
  expect(page).to have_content(message)
end

Given("I am not logged in") do
end

Then("I should be redirected to the login page") do
  message = 'Welcome'
  expect(page).to have_content(message)
end