class RemoveAppointedPersonForEnglandAndWalesOrganisation < ActiveRecord::Migration
  def up
    organisation = Organisation.find_by_slug('appointed-person-for-england-and-wales-under-the-proceeds-of-crime-act-2002')
    if organisation.present?
      # These would need extra redirects or deciding what to do with if there
      # were any
      raise "Unexpected contacts for #{organisation.title}" if organisation.contacts.count > 0

      organisation.contact_groups.destroy_all
      organisation.destroy
    end
  end

  def down
    # This org was created in error, there's no need for a down to re-instate it
  end
end
