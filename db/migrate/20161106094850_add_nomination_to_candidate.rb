class AddNominationToCandidate < ActiveRecord::Migration
  def change
    add_reference :candidates, :nomination, index: true, foreign_key: true
  end
end
