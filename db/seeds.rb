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

(1..10).each do |i|
  Store.find_or_create_by(id: i) do |s|
    s.name = 'Pandora ' + i.to_s
    s.event_type = 'Grand Opening'
    s.event_date = rand(2..8).days.ago
    s.district = 'Central'
    s.address = 'Unit 12B, 123 Fake Avenue, Central, Hong Kong'
    s.lat = 22.282118
    s.lng = 114.151063
    s.description = '70% off everything'
    s.bhours_0 = '8:00 am - 6:00 pm'
    s.bhours_1 = '8:00 am - 6:00 pm'
    s.bhours_2 = '8:00 am - 6:00 pm'
    s.bhours_3 = '8:00 am - 6:00 pm'
    s.bhours_4 = '8:00 am - 6:00 pm'
    s.bhours_5 = '8:00 am - 6:00 pm'
    s.bhours_6 = '8:00 am - 6:00 pm'
    s.bhours_7 = '8:00 am - 6:00 pm'
    s.phone = '123-456-7890'
    s.url = 'www.example.com'
    s.state = 'active'
    s.user_id = 1
    s.goods = Good.all
    s.discount = rand(2..8).to_s + "0"
    s.photos.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'store.jpg')), filename: 'store.jpg', content_type: 'image/png')
  end
end

(11..20).each do |i|
  Store.find_or_create_by(id: i) do |s|
    s.name = 'Planet Sales ' + i.to_s
    s.event_type = 'Farewell Sale'
    s.event_date = rand(2..8).days.from_now
    s.district = 'Central'
    s.address = 'Unit 1234, 123 Fake Corner, Causeway Bay, Hong Kong'
    s.lat = 22.2821181
    s.lng = 114.1510632
    s.description = '80% off everything'
    s.bhours_0 = '8:00 am - 6:00 pm'
    s.bhours_1 = '8:00 am - 6:00 pm'
    s.bhours_2 = '8:00 am - 6:00 pm'
    s.bhours_3 = '8:00 am - 6:00 pm'
    s.bhours_4 = '8:00 am - 6:00 pm'
    s.bhours_5 = '8:00 am - 6:00 pm'
    s.bhours_6 = '8:00 am - 6:00 pm'
    s.bhours_7 = '8:00 am - 6:00 pm'
    s.phone = '123-456-7890'
    s.url = 'www.example.com'
    s.state = 'active'
    s.user_id = 1
    s.goods = Good.all
    s.discount = rand(2..8).to_s + "0"
    s.photos.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'store.jpg')), filename: 'store.jpg', content_type: 'image/png')
  end
end

100.times do
  Comment.create do |c|
    c.text = 'Hello world'
    c.user_id = 1
    c.store_id = rand(1..20)
  end
end

Bookmark.find_or_create_by(id: 1) do |c|
  c.user_id = 1
  c.store_id = 1
end

(1..20).each do |i|
  Vote.find_or_create_by(
    user_id: i,
    votable: Store.find(i),
    vote: 1
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

(1..20).each do |i|
  Store.find(i).tags = Tag.all.sample(rand(2..5))
end