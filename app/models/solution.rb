class Solution < ActiveRecord::Base
	validates :content,
	presence: true

  belongs_to :user
  belongs_to :question
  has_many :rating
end
