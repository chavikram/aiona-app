class NominationAttachment < ActiveRecord::Base

  belongs_to :nomination, dependent: :destroy
  mount_uploader :attachment, AttachmentUploader
  
  validate :attachment_size_validation

  private
    def attachment_size_validation
      errors[:attachment] << "should be less than 500KB" if attachment.size > 2.5.megabytes
    end

end


