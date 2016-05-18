class RatingController < ApplicationController
	before_action :is_authenticated?
  before_action :current_user

  def create

   @rating = 	Rating.create(value: params[:value_id], user_id: @current_user[:id], solution_id: set_solution[:id])
   redirect_to solutions_path
  end

  private

  def set_solution
    @solution = Solution.find(params[:id])  
  end
end
