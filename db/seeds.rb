# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create user
stanDaMan = User.find_or_create_by({
	name: 'StanDaMan',
	email: 'standaman@mail.com',
	password_digest: 'Password123'})

# create tags
easyTag = Tag.find_or_create_by({name: 'easy'})
middleTag = Tag.find_or_create_by({name: 'middle'})

# create questions
fibonacci_m = Question.find_or_create_by(
	{content: "By definition, the first two numbers in the Fibonacci sequence are 0 and 1, and each subsequent number is the sum of the previous two." +
		"\n    The first ten Fibonacci numbers are:" +
		"\n    0, 1, 1, 2, 3, 5, 8, 13, 21, 34"
	})

acronym_q = Question.find_or_create_by(
	{content: "Write a function named 'acronym' that takes a string and returns an acronym." + 
		"\n    acronym('Syntactically awesome style sheets'); // returns 'SASS'" +
		"\n    acronym('Washinton State Department of Transportation') // returns 'WSDOT'" +
		"\n    acronym(\"GNU's not Unix\") // returns 'GNU'"
	})


factorial_q =	Question.find_or_create_by(
	{content: "Write a function named 'factorial' that takes an integer and returns the factorial of that number." +
		"\n    factorial(5); // returns 5x4x3x2x1 which is 120" +
		"\n    factorial(0); // returns 1" +
		"\n    factorial(-1); // returns undefined"
	})


factors_q =	Question.find_or_create_by(
	{content: "Write a function named factors that takes an integer and returns an array of its non-negative factors." +
		"\n    factors(9); // returns [1,3,9]" +
		"\n    factors(360); // returns [1,2,3,4,5,6,8,9,10,12,15,18,20,24,30,36,40,45,60,72,90,120,180,360]" +
		"\n    factors(0); // returns [0]"
	})

# associate tags with questions
unless acronym_q.tags.exists?({name: 'easy'})
	acronym_q.tags << easyTag
end
unless factorial_q.tags.exists?({name: 'easy'})
	factorial_q.tags << easyTag
end
unless factors_q.tags.exists?({name: 'medium'})
	factors_q.tags << mediumTag
end
unless fibonacci_m.tags.exists?({name: 'hard'})
	fibonacci_m.tags << mediumTag
end



# answer a question
factors_a = Solution.find_or_create_by({user_id: stanDaMan.id, question_id: factors_q.id,
	content: "function factors(x){" +
		"\n  var factorArr = [];" +
		"\n  var limit = Math.sqrt(x);" +
		"\n  for (let i = 1; i <= limit; i++){" +
		"\n    if (x % i === 0){" +
		"\n      factorArr.push(i);" +
		"\n      if(i != x / i){" +
		"\n        factorArr.push(x / i);" +
		"\n        }" +
		"\n      }" +
		"\n    }" +
		"\n    factorArr.sort(function(a,b){return a-b});" +
		"\n  return factorArr;" +
		"}"})

	