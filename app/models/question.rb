class Question < ActiveRecord::Base
	has_and_belongs_to_many :tags
	has_many :solutions

  def score 
  self.get_upvotes.size - self.get_downvotes.size
  end
end
