class RenameOrderToSortOrderInPost < ActiveRecord::Migration
  
  def change
    rename_column :posts, :order, :sort_order

  end
  
end
