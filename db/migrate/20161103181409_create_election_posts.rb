class CreateElectionPosts < ActiveRecord::Migration
  def change
    create_table :election_posts do |t|
      t.references :election, index: true, foreign_key: true
      t.references :post, index: true, foreign_key: true
      t.integer :no_of_post
      t.integer :sort_order
      t.boolean :deleted

      t.timestamps null: false
    end
  end
end
