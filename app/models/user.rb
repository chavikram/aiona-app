class User < ActiveRecord::Base

  has_one_time_password column_name:  :otp_secret_key 
  has_one_time_password counter_based: true, counter_column_name: :my_otp_counter

end
