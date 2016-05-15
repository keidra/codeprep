class Question < ActiveRecord::Base
  belongs_to :tag
  has_many :solution
end
