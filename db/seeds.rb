# The tests expect an empty database
return if Rails.env.test?

# See app/tasks/seed_database
SeedDatabase.instance.run
