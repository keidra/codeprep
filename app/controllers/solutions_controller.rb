class SolutionsController < ApplicationController
  before_action :is_authenticated?, only: [:new, :create]
  before_action :set_solution, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :current_user

  def index

    @question = Question.find(params[:id])
    @solutions = Solution.find_by({question_id: @question.id}).order(:cached_votes_score => :desc)

  end


  def new
  end

  def destroy
    Solution.find(params[:id]).delete
  end

  def create

    solution = Solution.create solution_params do |p|
      p.user_id = @current_user.id
      p.save
    end
    if solution.valid?
      flash[:success] = 'Solution posted!'
      redirect_to root_path
    else
      messages = solution.errors.map { |k, v| "#{k} #{v}" }
      flash[:danger] = messages.join(', ')
      redirect_to new_solution_path
    end
  end

  def show
    @solution = Solution.includes(:user, :question, :rating, :comment).find({user: params[:user_id], question: params[:question_id]})
  end

  def mysolutions
    @solutions = Solution.includes(:question).where({user_id: @current_user.id})

    #@questions = []

    #@solutions.each do |solution|
    #  @questions << solution.question
    #end

    #render :json => @solutions
    #render :json => @questions
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

  def solution_params
    params.require(:solution).permit(:content, :question_id)
  end

end
