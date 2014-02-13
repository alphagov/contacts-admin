module ContactsHelper
  def vcard_for_post_address(address)
    title = content_tag :h4, class: "fn" do
      address.title
    end
    street_address = content_tag :span, class: "street-address" do
      govspeak address.street_address
    end
    locality = content_tag :span, class: "locality" do
      govspeak address.locality
    end
    region = content_tag :span, class: "region" do
      govspeak address.region
    end
    postal_code = content_tag :span, class: "postal-code" do
      govspeak address.postal_code
    end
    world_location = content_tag :span, class: "country-name" do
      govspeak address.world_location.try(:name)
    end
    content_tag :span, class: "vcard" do
      [title, street_address, locality, region, postal_code, world_location].join.html_safe
    end
  end

  def contact_top_details_present(contact)
    if (contact.quick_link_title_1.present? && contact.quick_link_1.present?) or (contact.quick_link_title_2.present? && contact.quick_link_2.present?) or (contact.quick_link_title_3.present? && contact.quick_link_3.present?)  or contact.quick_answer.present? or contact.important_link1.present? or contact.important_link2.present?
      return true
    end
  end
end
