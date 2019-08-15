# Reading List

## Task
Create a simple web app that allows the user to create a list of books they would like to read. Please use an MVC framework of your choice (e.g., Laravel, Ruby on Rails). You will not be judged on the framework that you choose, so choose whichever framework will allow you to work efficiently and best showcase your skills.

Users should be able to perform the following actions:
* ✔ Add or remove books from the list
* ✔ Change the order of the books in the list
* ✔ Sort the list of books by their author
* ✔ Display a book detail page with a minimum of author, publication date, and title

Please use your framework's ORM rather than crafting queries by hand.

To submit your test, please fork this repository, commit all work to the master branch of your fork, and send us a link to your forked repository.

##### Bonus points!
* ✔ Deploy it for real so we can play with it! (and then tell us about how you deployed it)
	- I've deployed it here: https://thefinerthings.herokuapp.com/ 
	- I did it by setting up a production config to work with the heroku service
* ✔ Handle image uploading while adding books to the list
* ✔ Do something fancy like integrating an external API or handling user authentication
	- I setup some simple bare bones user authentication
	- I created a test user with the username 'test@test.com' and the password 'funtest'