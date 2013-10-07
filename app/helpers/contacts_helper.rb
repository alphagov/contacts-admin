module ContactsHelper
  def vcard_for_post_address(address)
    title = content_tag :h4, class: "fn" do
      address.title
    end
    street_address = content_tag :span, class: "street-address" do
      markdown address.street_address
    end
    locality = content_tag :span, class: "locality" do
      markdown address.locality
    end
    region = content_tag :span, class: "region" do
      markdown address.region
    end
    postal_code = content_tag :span, class: "postal-code" do
      markdown address.postal_code
    end
    world_location = content_tag :span, class: "country-name" do
      markdown address.world_location.try(:name)
    end
    content_tag :span, class: "vcard" do
      [title, street_address, locality, region, postal_code, world_location].join.html_safe
    end
  end
end