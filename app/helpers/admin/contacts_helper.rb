module Admin
  module ContactsHelper
    def filter_terms_for_group(contact_group)
      [contact_group.to_s, contact_group.contacts.map(&:to_s)].flatten.join(" ")
    end

    def contact_url(organisation, contact)
      URI.join(
        Plek.new.website_root,
        "/government/organisations/#{organisation.slug}/contact/#{contact.slug}",
      ).to_s
    end

    def vcard_for_post_address(address)
      title = tag.strong class: "fn" do
        address.title
      end
      street_address = tag.span class: "street-address" do
        address.street_address
      end
      locality = tag.span class: "locality" do
        address.locality
      end
      region = tag.span class: "region" do
        address.region
      end
      postal_code = tag.span class: "postal-code" do
        address.postal_code
      end
      world_location = tag.span class: "country-name" do
        address.world_location.try(:name)
      end
      tag.div class: "vcard" do
        safe_join(
          [
            title,
            street_address,
            locality,
            region,
            postal_code,
            world_location,
          ],
          tag(:br),
        )
      end
    end
  end
end
