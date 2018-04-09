class AddActiveToElections < ActiveRecord::Migration
  def change
    add_column :elections, :active, :boolean
  end
end
