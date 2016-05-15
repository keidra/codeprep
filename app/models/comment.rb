class Comment < ActiveRecord::Base
	validates :content,
	length: {in 6..255}

  belongs_to :user
  belongs_to :solution
end
