class SolutionsController < ApplicationController
  before_action :is_authenticated?, only: [:new, :create]
  before_action :set_solution, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :current_user

  def index

    @question = Question.find_by_id question_params
    @solutions = Solution.find_by({question_id: @question.id}).order(:cached_votes_score => :desc)

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

  def mysolutions
    @solutions = Solution.includes(:question).where({user_id: @current_user.id})
    #render plain: @solutions[0].content
    render :json => @solutions
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

  def question_params 
  params.require(:question).permit(:id)
  end
end
