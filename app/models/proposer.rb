class Proposer < ActiveRecord::Base
  belongs_to :honorific
  belongs_to :designation
  belongs_to :nomination

  validates :honorific_id,:first_name,:last_name,:emp_code,:ainoa_membership_no,
  :designation_id,:office_address1,
  :mobile_no, presence: true
  validates :mobile_no, length: { is: 10}

#  validates :honorific_id,:emp_code,:ainoa_membership_no,
#  :designation_id,:mobile_no, numericality: true


end

