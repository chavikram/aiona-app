class AddElectionPostToNomination < ActiveRecord::Migration
  def change
    add_reference :nominations, :election_post, index: true, foreign_key: true
  end
end
