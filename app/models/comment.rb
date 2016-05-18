class Comment < ActiveRecord::Base
	validates :content,
	:minimum => 6

  belongs_to :user
  belongs_to :solution
end
