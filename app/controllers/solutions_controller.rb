class SolutionsController < ApplicationController
  before_action :is_authenticated?, only: [:new, :create]
  before_action :set_solution, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def index
    @solutions = Solution.all
  end

  def new
  end

  def destroy
    Solution.find(params[:id]).delete
  end

  def create

  end

  def show
    @solution = Solution.includes(:user, :question, :rating, :comment).find({user: params[:user_id], question: params[:question_id]})
  end

  def upvote
  @solution.upvote_from current_user
  redirect_to solutions_path
  end

  def downvote
  @solution.downvote_from current_user
  redirect_to solutions_path
  end

  private

  def set_solution
    @solution = Solution.find(params[:id])
    
  end
end
