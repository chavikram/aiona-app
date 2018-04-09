class Member < ActiveRecord::Base

	 belongs_to :designation, :foreign_key  => "designation_code", :class_name => "Designation" 

	validates :name, presence: true,length: { in: 6..20 }
    validates :emp_code, presence: true
    validates :emp_code, presence: true
    validates :designation_code, presence: true
    validates :ainoa_membership_no, presence: true
    validates :state_code, presence: true
    validates :mobile_no, presence: true
    validates :email, presence: true

end
