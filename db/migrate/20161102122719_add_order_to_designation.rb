class AddOrderToDesignation < ActiveRecord::Migration
  def change
    add_column :designations, :order, :integer
  end
end
