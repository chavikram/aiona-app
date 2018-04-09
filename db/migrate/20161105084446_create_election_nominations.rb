class CreateElectionNominations < ActiveRecord::Migration
  def change
    create_table :election_nominations do |t|
      t.references :election, index: true, foreign_key: true
      t.date :start_date
      t.datetime :form_issue_date
      t.datetime :online_filing_start_date
      t.datetime :online_filing_end_date
      t.date :offline_filing_start_date
      t.date :offline_filing_end_date
      t.integer :online_filing_extended_time
      t.integer :offline_filing_extended_days
      t.integer :sort_order
      t.boolean :deleted
      t.boolean :active
      t.datetime :result_datetime

      t.timestamps null: false
    end
  end
end
