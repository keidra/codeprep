class Comment < ActiveRecord::Base
	validates :content,
	length: {minimum: 6}

  belongs_to :user
  belongs_to :solution
end
