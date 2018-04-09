class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.references :honorific, index: true, foreign_key: true
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :emp_code
      t.string :ainoa_membership_no
      t.references :designation, index: true, foreign_key: true
      t.date :superannuation_date
      t.string :office_address1
      t.string :office_address2
      t.string :city
      t.references :state, index: true, foreign_key: true
      t.string :office_tel_no
      t.string :mobile_no
      t.string :res_tel_no
      t.string :email
      t.date :signing_date

      t.timestamps null: false
    end
  end
end
