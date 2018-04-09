class CreateNominationAttachments < ActiveRecord::Migration
  def change
    create_table :nomination_attachments do |t|
      t.references :nomination, index: true, foreign_key: true
      t.string :attachment

      t.timestamps null: false
    end
  end
end
