now = Time.now
puts "Start seeding process at #{now}"

district_names = [
  'Aberdeen',
  'Admiralty',
  'Ap Lei Chau',
  'Causeway Bay',
  'Central',
  'Chai Wan',
  'Chek Lap Kok',
  'Cheung Chau',
  'Cheung Sha Wan',
  'Choi Hung',
  'Cyberport',
  'Deep Water Bay',
  'Diamond Hill',
  'Discovery Bay',
  'Fanling',
  'Fo Tan',
  'Heng Fa Chuen',
  'Ho Man Tin',
  'Hung Hom',
  'Jordan',
  'Knutsford Terrace',
  'Kowloon Bay',
  'Kowloon City',
  'Kowloon Tong',
  'Kwai Chung',
  'Kwai Fong',
  'Kwun Tong',
  'Lai Chi Kok',
  'Lam Tin',
  'Lamma Island',
  'Lan Kwai Fong',
  'Lantau Island',
  'Lau Fau Shan',
  'Lei Yue Mun',
  'Lo Wu',
  'Lok Fu',
  'Lok Ma Chau',
  'Ma On Shan',
  'Ma Wan',
  'Mei Foo',
  'Mid-Levels',
  'Mong Kok',
  'Ngau Tau Kok',
  'North Point',
  'Ping Chau',
  'Po Toi Island',
  'Pok Fu Lam',
  'Prince Edward',
  'Quarry Bay',
  'Repulse Bay',
  'Sai Kung',
  'Sai Wan Ho',
  'San Po Kong',
  'Sha Tin',
  'Sham Shui Po',
  'Sham Tseng',
  'Shau Kei Wan',
  'Shek Kip Mei',
  'Shek O',
  'Sheung Shui',
  'Sheung Wan',
  'Soho',
  'Stanley',
  'Tai Hang',
  'Tai Kok Tsui',
  'Tai Koo',
  'Tai O',
  'Tai Po',
  'Tai Wai',
  'Tai Wo',
  'The Peak',
  'Tin Hau',
  'Tin Shui Wai',
  'To Kwa Wan',
  'Tseung Kwan O',
  'Tsim Sha Tsui',
  'Tsing Yi',
  'Tsuen Wan',
  'Tsz Wan Shan',
  'Tuen Mun',
  'Tung Chung',
  'Wan Chai',
  'Western District',
  'Wong Chuk Hang',
  'Wong Tai Sin',
  'Yau Ma Tei',
  'Yau Tong',
  'Yuen Long'
]

district_names.each do |district_name|
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

(1..100).each do |i|
  Store.find_or_create_by(id: i) do |s|
    s.name = 'Pandora ' + i.to_s
    s.event_type = 'Grand Opening'
    s.event_date = rand(2..8).days.ago
    s.district = District.order("RAND()").limit(1).first
    s.address = 'Unit 12B, 123 Fake Avenue, Central, Hong Kong'
    s.lat = 22.282118 + rand(-0.05..0.05)
    s.lng = 114.151063 + rand(-0.05..0.05)
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

(101..200).each do |i|
  Store.find_or_create_by(id: i) do |s|
    s.name = 'Planet Sales ' + i.to_s
    s.event_type = 'Farewell Sale'
    s.event_date = rand(2..8).days.from_now
    s.district = District.order("RAND()").limit(1).first
    s.address = 'Unit 1234, 123 Fake Corner, Causeway Bay, Hong Kong'
    s.lat = 22.282118 + rand(-0.05..0.05)
    s.lng = 114.151063 + rand(-0.05..0.05)
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

400.times do
  Comment.create do |c|
    c.text = 'Hello world'
    c.user_id = 1
    c.store_id = rand(1..200)
  end
end

(1..200).each do |i|
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

(1..200).each do |i|
  Store.find(i).tags = Tag.all.sample(rand(2..5))
end

later = Time.now
puts "Seeding is finished.  It took #{later - now} seconds"