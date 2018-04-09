class CreateDesignations < ActiveRecord::Migration
  def change
    create_table :designations do |t|
      t.integer :code
      t.string :title
      t.string :short_code

      t.timestamps null: false
    end
  end
end
