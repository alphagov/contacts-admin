class ContactGroupType
  attr_reader :title, :contact_groups

  def initialize(title, contact_groups)
    @title = title
    @contact_groups = contact_groups
  end

  def self.all
    ContactGroup.all.map(&:contact_group_type).uniq.map { |contact_group_type_name|
      new(
        contact_group_type_name,
        ContactGroup.all.select { |contact_group|
          contact_group.contact_group_type == contact_group_type_name
        }
      )
    }
  end
end
