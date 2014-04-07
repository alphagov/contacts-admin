namespace :organisations do
  desc "Import organisations from Whitehall"
  task :import => :environment do
    ImportOrganisations.new.call
  end
end
