class ContactFormLinksPresenter
  include GovspeakHelper

  def initialize(contact_form_links)
    @contact_form_links = contact_form_links
  end

  def present
    @contact_form_links.map do |link|
      {
        title: link.title,
        link: link.link,
        description: govspeak(link.description),
      }
    end
  end
end
