class AddRegistrationNoToNominationAttachment < ActiveRecord::Migration
  def change
    add_column :nomination_attachments, :registration_no, :integer
  end
end
