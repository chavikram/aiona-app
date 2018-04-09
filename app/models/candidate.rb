class Candidate < ActiveRecord::Base
  belongs_to :honorific
  belongs_to :designation
  belongs_to :state
  belongs_to :nomination

  validates :honorific_id,:first_name,:last_name,:emp_code,:ainoa_membership_no,
  :designation_id,:superannuation_date,:office_address1,
  :office_tel_no,:mobile_no,:res_tel_no,:email,:place_of_posting, presence: true
  validates :office_tel_no,:mobile_no,:res_tel_no, length: { is: 10}
  
  validates :email, email: true

# validates :honorific_id,:emp_code,:ainoa_membership_no,  :designation_id,:state_id,:office_tel_no,:mobile_no,:res_tel_no, numericality: true


end
