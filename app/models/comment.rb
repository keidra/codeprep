class Comment < ActiveRecord::Base
  acts_as_votable
	validates :content,
	length: {minimum: 6}

  belongs_to :user
  belongs_to :solution
end
