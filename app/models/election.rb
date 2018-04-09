class Election < ActiveRecord::Base

  belongs_to :election_type
  has_many :election_posts, dependent: :destroy
  has_many :election_nominations, dependent: :destroy

end

