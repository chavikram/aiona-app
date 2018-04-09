class AddRagistrationNoToNomination < ActiveRecord::Migration
  def change
    add_column :nominations, :registration_no, :integer
  end
end
