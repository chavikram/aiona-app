class RenameOrderToSortOrderInDesignation < ActiveRecord::Migration
  def change
  	    rename_column :designations, :order, :sort_order

  end
end
