class AddStateToElectionPost < ActiveRecord::Migration
  def change
    add_reference :election_posts, :state, index: true, foreign_key: true
  end
end
