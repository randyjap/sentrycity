require('./db/districts')

now = Time.now
puts "Start seeding process at #{now}"

DISTRICT_NAMES.each do |district_name|
  District.find_or_create_by(name: district_name)
end

User.find_or_create_by(id: 1) do |u|
  u.password = 'password'
  u.email = 'randyjap@gmail.com'
  u.name = 'Walt D'
end

goods = [
  'Fashion',
  'Clothing',
  'Electronics & Computers',
  'Books',
  'Pet Supplies',
  'Baby',
  'Beauty & Healthcare',
  'Other',
]

goods.each { |g| Good.find_or_create_by(name: g) }

(1..25).each do |i|
  Store.find_or_create_by(id: i) do |s|
    s.name = 'Pandora ' + i.to_s
    s.event_type = 'Grand Opening'
    s.event_date = rand(2..8).days.ago
    s.district = District.order("RAND()").limit(1).first
    s.address = 'Unit 12B, 123 Fake Avenue, Central, Hong Kong'
    s.lat = 22.282118 + rand(-0.05..0.05)
    s.lng = 114.151063 + rand(-0.05..0.05)
    s.description = '70% off everything'
    s.bhours_0 = '8;18'
    s.bhours_1 = '8;18'
    s.bhours_2 = '8;18'
    s.bhours_3 = '8;18'
    s.bhours_4 = '8;18'
    s.bhours_5 = '8;18'
    s.bhours_6 = '8;18'
    s.bhours_7 = '8;18'
    s.phone = '123-456-7890'
    s.url = 'www.example.com'
    s.state = 'active'
    s.user_id = 1
    s.goods = Good.all
    s.discount = rand(2..8).to_s + "0"
    s.photos.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'store.jpg')), filename: 'store.jpg', content_type: 'image/png')
  end
end

(26..50).each do |i|
  Store.find_or_create_by(id: i) do |s|
    s.name = 'Planet Sales ' + i.to_s
    s.event_type = 'Farewell Sale'
    s.event_date = rand(2..8).days.from_now
    s.district = District.order("RAND()").limit(1).first
    s.address = 'Unit 1234, 123 Fake Corner, Causeway Bay, Hong Kong'
    s.lat = 22.282118 + rand(-0.05..0.05)
    s.lng = 114.151063 + rand(-0.05..0.05)
    s.description = '80% off everything'
    s.bhours_0 = '8;18'
    s.bhours_1 = '8;18'
    s.bhours_2 = '8;18'
    s.bhours_3 = '8;18'
    s.bhours_4 = '8;18'
    s.bhours_5 = '8;18'
    s.bhours_6 = '8;18'
    s.bhours_7 = '8;18'
    s.phone = '123-456-7890'
    s.url = 'www.example.com'
    s.state = 'active'
    s.user_id = 1
    s.goods = Good.all
    s.discount = rand(2..8).to_s + "0"
    s.photos.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'store.jpg')), filename: 'store.jpg', content_type: 'image/png')
  end
end

10.times do
  Comment.create do |c|
    c.text = 'Hello world'
    c.user_id = 1
    c.store_id = rand(1..200)
  end
end

(1..50).each do |i|
  Vote.find_or_create_by(
    user_id: 1,
    votable: Store.find(i),
    vote: 1
  )
  Bookmark.find_or_create_by(
    id: i,
    user_id: 1,
    store_id: i
  )
end

tag_names = [
  'Fashion',
  'Clothing',
  'Electronics & Computers',
  'Books',
  'Pet Supplies',
  'Baby',
  'Beauty and Healthcare',
  'Other'
]

tag_names.each do |tag_name|
  Tag.find_or_create_by(
    name: tag_name
  )
end

(1..50).each do |i|
  Store.find(i).tags = Tag.all.sample(rand(2..5))
end

later = Time.now
puts "Seeding is finished.  It took #{later - now} seconds"