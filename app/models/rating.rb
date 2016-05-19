class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :solution
  belongs_to :question
end

