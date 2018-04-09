class AddNominationToSeconder < ActiveRecord::Migration
  def change
    add_reference :seconders, :nomination, index: true, foreign_key: true
  end
end
