module ContactsHelper
  def vcard_for_post_address(address)
    title = content_tag :strong, class: "fn" do
      address.title
    end
    street_address = content_tag :span, class: "street-address" do
      address.street_address
    end
    locality = content_tag :span, class: "locality" do
      address.locality
    end
    region = content_tag :span, class: "region" do
      address.region
    end
    postal_code = content_tag :span, class: "postal-code" do
      address.postal_code
    end
    world_location = content_tag :span, class: "country-name" do
      address.world_location.try(:name)
    end
    content_tag :div, class: "vcard" do
      [title, street_address, locality, region, postal_code, world_location].join('<br>').html_safe
    end
  end

  def contact_path(organisation, contact)
    "#{contacts_path(organisation.slug)}/#{contact.slug}"
  end

  def contact_url(organisation, contact)
    URI::join(Plek.current.website_root, contact_path(organisation, contact)).to_s
  end
end
