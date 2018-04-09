class Post < ActiveRecord::Base
  belongs_to :election_type
  def to_s
  	self.name
  end

end
