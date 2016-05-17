class RatingController < ApplicationController
	before_action :is_authenticated?

  def create
   @rating = 	Rating.create(value: params[:value_id], user_id: @current_user, solution_id: params[:solution_id])
   redirect_to solutions_path
  end
end
