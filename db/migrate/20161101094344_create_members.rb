class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.integer :emp_code
      t.integer :designation_code
      t.integer :ainoa_membership_no
      t.string :state_code
      t.string :mobile_no
      t.string :email

      t.timestamps null: false
    end
  end
end
