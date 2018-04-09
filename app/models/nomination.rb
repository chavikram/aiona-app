class Nomination < ActiveRecord::Base

  belongs_to :election
  belongs_to :state
  belongs_to :election_post
  has_one :candidate, dependent: :destroy
  has_one :proposer, dependent: :destroy
  has_one :nomination_attachment
  has_many :seconders,inverse_of: :nomination, dependent: :destroy
  validates :election_id,:state_id,:election_post_id, presence: true
  accepts_nested_attributes_for :candidate, :allow_destroy => true
  accepts_nested_attributes_for :proposer, :allow_destroy => true
  accepts_nested_attributes_for :seconders, :allow_destroy => true

end
