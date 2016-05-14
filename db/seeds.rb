# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([
	{name: 'StanDaMan', email: 'standaman@mail.com', password: 'Password123'}
	])

Question.create([
	{content: "Write a function named to 'acronym' that takes a string and returns an acronym."
		+ "\n    acronym('Syntactically awesome style sheets'); // returns 'SASS'"
		+ "\n    acronym('Washinton State Department of Transportation') // returns 'WSDOT'"
		+ "\n    acronym('GNU's not Unix') // returns 'GNU'"},
	{content: "Write a function named 'factorial' that takes an integer and returns the factorial of that number."
		+ "\n    factorial(5); // returns 5x4x3x2x1 which is 120"
		+ "\n    factorial(0); // returns 1"},
		+ "\n    factorial(-1); // returns undefined"},
	{content: "Write a function named factors that takes an integer and returns an array of its non-negative factors."
		+ "\n    factors(9); // returns [1,3,9]"
		+ "\n    factors(360); // returns [1,2,3,4,5,6,8,9,10,12,15,18,20,24,30,36,40,45,60,72,90,120,180,360]"}
		+ "\n    factors(0); // returns [0]"}
	])	}
