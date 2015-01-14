namespace :finders do
  desc "Publish Finders for each Org's Contacts"
  task :publish => :environment do
    Organisation.all.each do |org|
      if org.contact_groups.any?
        presenter = ContactsFinderPresenter.new(org)
        Contacts::Publisher.publish(presenter)
      end
    end
  end
end
