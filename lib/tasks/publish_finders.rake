namespace :finders do
  desc 'Publish finder pages to the publishing API'
  task publish: :environment do
    puts "Publishing finders"
    PublishFinders.call
  end
end

# Alias of the above task for the benefit of` govuk-app-deployment`
task "publishing_api:publish": "finders:publish"
