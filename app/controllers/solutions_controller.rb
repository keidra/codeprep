class SolutionsController < ApplicationController
  before_action :is_authenticated?, only: [:new, :create]

  def index
    @question = Question.find_by_id question_params
    @solutions = Solution.find_by({question_id: @question.id})
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

private

def question_params 
  params.require(:question).permit(:id)
end
end
