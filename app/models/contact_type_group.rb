class ContactTypeGroup
  attr_reader :title, :contact_types

  def initialize(title, contact_types)
    @title = title
    @contact_types = contact_types
  end

  def self.all
    ContactType.all.map(&:contact_type_group).uniq.map { |contact_type_group_name|
      new(
        contact_type_group_name,
        ContactType.all.select { |contact_type|
          contact_type.contact_type_group == contact_type_group_name
        }
      )
    }
  end
end
