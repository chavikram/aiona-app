class CreateElections < ActiveRecord::Migration
  def change
    create_table :elections do |t|
      t.string :name
      t.date :election_date
      t.datetime :election_start_time
      t.datetime :election_end_time
      t.integer :extended_time
      t.references :election_type, index: true, foreign_key: true
      t.integer :sort_order
      t.boolean :deleted

      t.timestamps null: false
    end
  end
end
