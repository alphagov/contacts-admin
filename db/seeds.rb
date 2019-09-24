# This env var is set by the beforeTest action in our Jenkinsfile
unless ENV.key?("RUNNING_IN_CI")
  # See app/tasks/seed_database
  ImportOrganisations.new.call
  SeedDatabase.instance.run
end
