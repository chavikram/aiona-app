class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.boolean :deleted
      t.references :election_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
