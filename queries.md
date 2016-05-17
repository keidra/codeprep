Queries.md

#Finding a new random question that hasn't been answered:

##First define a current user and a difficulty

@currentUser = User.find_by_id(session[:user_id])
@tag = Tag.find params[:name]

##Figure out how many solutions the current user has

solution_count = Solution.count({user_id: @currentUser.id})

##If the user has no solutions yet (solution_count === 0)
##Just grab a random question

@question = @tag.questions.limit(1).order("RANDOM()")

##If the user has 1 solution (solution_count === 1)
##Grab a random question that isn't the answered question

answered_question_id = Solution.find_by({user_id: @currentUser.id}).question_id
@question = @tag.questions.where.not(id: answered_question_id).limit(1).order("RANDOM()")

##If the user has more than 1 solution (solution_count > 1)
##Grab a random question based on an array

answered_question_ids = Solution.find_by({user_id: @currentUser.id}).question_id
@question = @tag.question.where.not(id: answered_question_ids).limit(1).order("RANDOM()")

#Displaying Answers to a question

##Given a known question ID and user

@currentUser = User.find_by_id(session[:user_id])
@question = Question.find params[:id]

##Grab the user's solution first then grab all others

@user_solution = Solution.find_by({user_id:currentUser.id, question_id:@question.id})

@solutions = Solution.find_by({question_id:@question.id}).where.not({user_id:currentUser.id})

##... have to figure out ratings and comments

@ratings_count = []
@comments_count = []

@solutions.each do |solution|
	@ratings_count << Rating.count({solution_id: solution.id})
	@comment_count << Comment.count({solution_id: solution.id})
end

# Showing a solution and each of it's comments

@solution = Solution.find_by_id(params[:id])
@comments = Comment.find_by(solution_id:params[:id])