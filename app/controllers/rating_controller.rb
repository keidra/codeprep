class RatingController < ApplicationController
	before_action :is_authenticated?

  def create
  	Rating.create(value: params[:value_id], user_id: @current_user, solution_id: params[:solution_id])
  end
end
