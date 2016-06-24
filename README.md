![Alt text](Screen1.png?raw=true "Screenshot 1")
![Alt text](Screen2.png?raw=true "Screenshot 2")


____________________________________

CODEPREP
____________________________________ 

Group Collaboration - Team Members: Josh Brian Keidra Hannah



HEROKU: https://code-prep.herokuapp.com/

WIREFRAMES: https://goo.gl/Q84wxi


TECHNOLOGIES USED:  HTML, CSS, jQuery, AJAX, Ruby, Ruby on Rails, pSQL, Forman, Bootstrap, ‘email_validator’ (gem), 'acts_as_votable' (gem), bcrypt,  'rails_12factor'( Gem for Heroku deployment) and Materialize.

__________________________________________________________________________________

Approach Taken //
We began our project by first conceptualizing the user experience. From there we were able collectively draw our primitive wireframes which Keidra then implemented via Balsamic. From there we created the skeleton of the app; Josh created the necessary controllers and models. 
 
After the basic functionality, we started working on the views pages where Keidra (our front-end developer) set up the visuals for most pages as well as formatting. At the same time, Josh (our backend developer) worked on the routes and controllers to make sure that all the methods were properly in place as well. Getting our MVP functionality of authentication (see unsolved problems below) as well as basic routes up took the majority of our time as well as seeding the database with users, solutions, and comments (Hannah). 

Brian, who is a full-stack developer, largely worked on the Countdown plugin as well as the ratings gem for comments which required a lot of documentation review and polymorphic understanding. This as well as other functionalities (skip buttons, content becoming non-editable after the countdown reaches 0, users unable to access questions or solutions without logging in) became the action items the group focused on post deployment to Heroku on Wednesday afternoon. 

USER Instructions //
1. Login 
2. Click the difficulty level (easy, medium, hard) for your first whiteboard question
3. In the form, type your solution to the problem before the timer runs out
4. Click on the submit button to submit your solution to the peer review
5. You will be redirected to the question page where you can see the question will all existing questions.
6. You are able to click into any individual solutions where a modal will pop up where you can like, down-like or comment on that solution.
7. You can view your current solutions by clicking the “My Solved” menu option from the upper right drop-down. 
8. Within your “My Solved” page, you can delete or edit any of your existing solutions. 
9. You can start a new question by selecting the “Questions” option from the menu.
10. You can log-out at anytime, knowing your valuable solutions are saved and ready for your next visit. 


Unsolved Problems //
1. Facebook Oauth in addition to a regular user login. Hannah coded the Facebook Oauth while Keidra worked on the general user login. At this time we realized that having both types of login options had the problematic potential for user_id conflicts and would require either a joined table for both users (where columns such as provider_id would be nill for non-facebook users). In the end, we decided to save this as a stretch goal.
2. Another big error that we experienced is with the "bootstrap_form_for" which caused a route error when trying to create a new comment.Turns out the form_for will not set abolute path, instead it only follows its (comment) controller. We hacked it by altering the routes.db path to "/solutions/comments/create"; essentially setting up the comments in routes instead of forms. 


User Stories //

1. The Main user is Stan DaMan who is a new developer looking to prepare for his first tech interviews with whiteboard practice. He is equally excited for the stress simulation (with the countdown clock) and peer review / ability to see how fellow programmers approached the same problem to learn new strategies. 
2. The secondary user is an experienced programmer who wants to help provide tips and insights to the public solutions as well as gain insight to the types of questions programmers are expecting in interviews. 
3. The final user would likely be any hiring manager or recruiter who is looking for a new up and coming programmer. They could look at the community forum for solutions to see who is frequently posting, helping and commenting on others' solutions. The


