class AddNominationToProposer < ActiveRecord::Migration
  def change
    add_reference :proposers, :nomination, index: true, foreign_key: true
  end
end
