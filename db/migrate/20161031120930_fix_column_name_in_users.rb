class FixColumnNameInUsers < ActiveRecord::Migration
  def change
  	    rename_column :users, :otp_counter, :my_top_counter
  end
end
