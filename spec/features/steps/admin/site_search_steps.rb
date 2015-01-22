module Admin
  module SiteSearchSteps
    def it_should_remove_the_page_from_search(contact)
      rummager_id = contact.link.gsub(%r{^/}, '')
      FakeRummageableIndex.any_instance.should_receive(:delete).with(rummager_id)
    end
  end
end
