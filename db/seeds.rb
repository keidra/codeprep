# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create user
stanDaMan = User.new({
	name: 'StanDaMan',
	email: 'standaman@mail.com',
	password: 'Password123'})

if stanDaMan.valid?
	stanDaMan.save
end

daJuiceMan = User.new({
	name: 'daJuiceMan',
	email: 'daJuiceMan@mail.com',
	password: 'YoMamasJuice'})

if daJuiceMan.valid?
	daJuiceMan.save
end

# create tags
easyTag = Tag.find_or_create_by({name: 'easy'})
mediumTag = Tag.find_or_create_by({name: 'middle'})
hardTag = Tag.find_or_create_by({name: 'hard'})

# create questions


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

fibonacci_m = Question.find_or_create_by(
	{content: "By definition, the first two numbers in the Fibonacci sequence are 0 and 1, and each subsequent number is the sum of the previous two." +
		"\n    The first ten Fibonacci numbers are:" +
		"\n    0, 1, 1, 2, 3, 5, 8, 13, 21, 34" +
		"\n    Write a function that accepts a number and returns the number at that position in the fionnaci sequence."
	})

non_repeat = Question.find_or_create_by(
{content: "Write a function that accepts a single string input and returns the first non-repeatd character" +
	"\n      'AABBC' returns C" +
	"\n      'AABBCCDEEFF' returns D"
	})

integer_length = Question.find_or_create_by(
{content: "Write a function that takes an integer as input and returns the number of digits in that integer" +
	"\n     'apple' returns 5"
	})

largest_palindrome = Question.find_or_create_by(
{content: "Write a function that finds the largest palindrome in a string. Al characters can be valid for the palindrome, including whitespace" +
	"\n     In the string 'I am a red racecar driver' the largest palindrome would be 'd racecar d'"
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
unless fibonacci_m.tags.exists?({name: 'medium'})
	fibonacci_m.tags << mediumTag
end
unless non_repeat.tags.exists?({name: 'easy'})
	non_repeat.tags << easyTag
end
unless integer_length.tags.exists?({name: 'easy'})
	integer_length.tags << easyTag
end
unless largest_palindrome.tags.exists?({name: 'easy'})
	largest_palindrome.tags <<hardTag
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

	