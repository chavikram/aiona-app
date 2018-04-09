class RenameOrderToSortOrderInElectionType < ActiveRecord::Migration
  def change
  	    rename_column :election_types, :order, :sort_order

  end
end
