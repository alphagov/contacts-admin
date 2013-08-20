User.new { |u|
  u.name = 'Winston'
  u.uid = 'winston'
  u.version = 1
  u.email = 'winston@alphagov.co.uk'
  u.permissions = ['signin']
}.save
