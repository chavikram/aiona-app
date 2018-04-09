class ElectionPost < ActiveRecord::Base
  belongs_to :election
  belongs_to :post 
  belongs_to :state
  has_many :nominations,dependent: :destroy
  validates_uniqueness_of :post,:scope=>[:election]
  def post_name
    self.post.name
  end
end
