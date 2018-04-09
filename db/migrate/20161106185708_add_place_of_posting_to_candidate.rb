class AddPlaceOfPostingToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :place_of_posting, :string
  end
end
