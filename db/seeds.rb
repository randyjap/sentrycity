User.find_or_create_by(id: 1) do |u|
  u.password = 'password'
  u.email = 'user01@example.com'
end

Store.find_or_create_by(id: 1) do |s|
  s.name = 'Pandora'
  s.event_type = 'Grand Opening'
  s.event_date = 7.days.ago
  s.district = 'Central'
  s.address = 'Unit 12B, 123 Fake Avenue, Central, Hong Kong'
  s.lat = 1234.123456
  s.lng = 1234.123456
  s.description = '50% off everything'
  s.bhours_0 = '9:22'
  s.bhours_1 = '9:22'
  s.bhours_2 = '9:22'
  s.bhours_3 = '9:22'
  s.bhours_4 = '9:22'
  s.bhours_5 = '9:22'
  s.bhours_6 = '9:22'
  s.bhours_7 = '9:22'
  s.phone = '1234567890'
  s.url = 'example'
  s.state = 'active'
  s.user_id = 1
end