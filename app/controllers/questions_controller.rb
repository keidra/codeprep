class QuestionsController < ApplicationController
	before_action :current_user
	before_action :is_authenticated?

  def show
  	@question = Question.find_by_id params[:id]
  	@solution_count = Solution.where({question_id: @question.id}).count

	  if(@solution_count === 0)
	  	render plain: "No solutions with this question"
		else
			@solutions = Solution.find_by({question_id: @question.id})
			# render plain: @solution_count
		end  	
  end

  def easy
  	@solution = Solution.new
  	@tag = Tag.find_by({name:"easy"})
	  @solution_count = Solution.where({user_id: @current_user.id}).count
	  puts "debug @solution_count " + @solution_count.to_s

	  if(@solution_count === 0)
	  	@question = @tag.questions.limit(1).order("RANDOM()")
		else
			@answered_question_ids = Solution.find_by({user_id: @current_user.id}).question_id
			@question = @tag.questions.where.not(id: answered_question_ids).limit(1).order("RANDOM()")
		end

		# render plain: @question[0].content
  end

  def medium
  	@solution = Solution.new
  	@tag = Tag.find_by({name:"medium"})
	  @solution_count = Solution.where({user_id: @current_user.id}).count

	  if(@solution_count === 0)
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
	  @solution_count = Solution.where({user_id: @current_user.id}).count

	  if(@solution_count === 0)
	  	@question = @tag.questions.limit(1).order("RANDOM()")
		else
			answered_question_ids = Solution.find_by({user_id: @current_user.id}).question_id
			@question = @tag.questions.where.not(id: answered_question_ids).limit(1).order("RANDOM()")
		end

		# render plain: @question[0].content
  end

end
