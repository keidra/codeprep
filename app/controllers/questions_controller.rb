class QuestionsController < ApplicationController
	before_action :current_user
	before_action :is_authenticated?

  def show
  	# @question = Question.find_by({id: ''})
    @tag = Tag.find_by_name params[:name]
    # render :json => @tag
  end

  def easy
  	@solution = Solution.new
  	@tag = Tag.find_by({name:"easy"})
	  solution_count = Solution.count({user_id: @current_user.id})

	  if(solution_count === 0)
	  	@question = @tag.questions.limit(1).order("RANDOM()")
		else
			answered_question_ids = Solution.find_by({user_id: @current_user.id}).question_id
			@question = @tag.questions.where.not(id: answered_question_ids).limit(1).order("RANDOM()")
		end

		# render plain: @question[0].content
  end

  def medium
  	@solution = Solution.new
  	@tag = Tag.find_by({name:"medium"})
	  solution_count = Solution.count({user_id: @current_user.id})

	  if(solution_count === 0)
	  	@question = @tag.questions.limit(1).order("RANDOM()")
		else
			answered_question_ids = Solution.find_by({user_id: @current_user.id}).question_id
			@question = @tag.questions.where.not(id: answered_question_ids).limit(1).order("RANDOM()")
		end

		# render plain: @question[0].content
  end

  def hard
  	@solution = Solution.new
  	@tag = Tag.find_by({name:"hard"})
	  solution_count = Solution.count({user_id: @current_user.id})

	  if(solution_count === 0)
	  	@question = @tag.questions.limit(1).order("RANDOM()")
		else
			answered_question_ids = Solution.find_by({user_id: @current_user.id}).question_id
			@question = @tag.questions.where.not(id: answered_question_ids).limit(1).order("RANDOM()")
		end

		# render plain: @question[0].content
  end

end
