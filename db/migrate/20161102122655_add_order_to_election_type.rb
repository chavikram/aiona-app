class AddOrderToElectionType < ActiveRecord::Migration
  def change
    add_column :election_types, :order, :integer
  end
end
