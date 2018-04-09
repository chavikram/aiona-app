class FixColumnNameInUsers1 < ActiveRecord::Migration
  def change
  	    rename_column :users, :my_top_counter, :my_otp_counter
  end
end
