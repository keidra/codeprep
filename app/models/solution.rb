class Solution < ActiveRecord::Base
  acts_as_votable
  belongs_to :user
  belongs_to :question


  def score 
  self.get_upvotes.size - self.get_downvotes.size
  end
end