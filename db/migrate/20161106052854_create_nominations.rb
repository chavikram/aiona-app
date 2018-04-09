class CreateNominations < ActiveRecord::Migration
  def change
    create_table :nominations do |t|
      t.references :election, index: true, foreign_key: true
      t.references :state, index: true, foreign_key: true
      t.references :candidate, index: true, foreign_key: true
      t.references :proposer, index: true, foreign_key: true
      t.boolean :accept_flag
      t.date :filing_date

      t.timestamps null: false
    end
  end
end
