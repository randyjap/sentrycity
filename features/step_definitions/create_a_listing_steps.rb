DISTRICT_NAME = 'Aberdeen'

Given("I visit add a store sale") do
  District.create(name: DISTRICT_NAME)
  Tag.create(name: "Fashion")
  visit(create_a_store_path)
end

When("I fill out a listing form") do
  fill_out_form_1
  click_button('Next Step')
  fill_out_form_2
  click_button('Next Step')
  fill_out_form_3
  click_button('Next Step')
  fill_out_form_4
  click_button('Finish')
end

Then("I should be able to see the listing") do
  click_link('See your listing')
  expect(page).to have_content("Pandora")
end

def fill_out_form_1
  choose('Farewell Sale')
  fill_in('store-name', with: 'Pandora')
  fill_in('event-date', with: '31/05/2019')
  select(DISTRICT_NAME, from: 'District')
  fill_in('pac-input', with: 'Where noone has gone before..')
end

def fill_out_form_2
  check('Fashion')
  fill_in('description', with: 'Super Sale')
end

def fill_out_form_3
  # TODO
end

def fill_out_form_4
  fill_in('form_phone', with: '555-5555')
  fill_in('form_website', with: 'www.example.com')
end
