# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app (Inherit Sinatra::Base)
- [x] Use ActiveRecord for storing information in a database (Inherit ActiveRecord::Migration)
- [x] Include more than one model class (e.g. User, Post, Category) (User, Appointment)
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) (User has many appointments)
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) (Appointment belongs to a user)
- [x] Include user accounts with unique login attribute (username or email) (username, email, password)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying (routes in Appointment_Controller)
- [x] Ensure that users can't modify content created by other users (Utilize helper method and ActiveRecord associations)
- [x] Include user input validations (Utilize ActiveRecord validation in models)
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) (Display ActiveRecord errors when creating account)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message