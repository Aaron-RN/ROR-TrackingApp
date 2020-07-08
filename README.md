# ROR-TrackingApp
The Back-end API for the Tracking App. Holds database info for All Users and allows RESTful HTTP requests to obtain and manipulate the User data.
The data held in this back-end API is related to User authentication, a food table and a note table.

## Models
### - User
- Uses **has_secure_password**
- **Has_many** association with Food Table
- Has three (3) unique fields: **:username, :email, :password_digest**

### - Food
- **Has_many** association with Notes Table
- Has seven (7) unique fields: **:user_id, :name, :date_consumed, :servings_consumed, :carbs, :fats, :proteins**

### - Note
- Has a **one to one** association with Food table
- Has two (2) unique fields: **:food_id, :body**

## Controllers
### Registration Controller
Handles new user account creations  
Parameters accepted: { user: { :username, :email, :password, :password_confirmation} }

### Sessions Controller
Handles User Login and Logout requests  
Parameters accepted: { user: { :username or :email, :password} }

### Food Controller
Handles food creation, deletion and editing  
Parameters accepted: { food: { :name, :date_consumed, :servings_consumed, :carbs, :fats, :proteins } }

### Note Controller
Handles note creation, deletion and editing  
Parameters accepted: { note: { :body } }

## Routes
<pre>
Prefix Verb   URI Pattern                                                                       Controller#Action
sessions POST   /sessions(.:format)                                                             sessions#create
registrations POST   /registrations(.:format)                                                   registrations#create
logout DELETE /logout(.:format)                                                                 sessions#logout
logged_in GET    /logged_in(.:format)                                                           sessions#logged_in
food_notes POST   /foods/:food_id/notes(.:format)                                               notes#create
food_note PATCH  /foods/:food_id/notes/:id(.:format)                                            notes#update
PUT    /foods/:food_id/notes/:id(.:format)                                                      notes#update
DELETE /foods/:food_id/notes/:id(.:format)                                                      notes#destroy
foods GET    /foods(.:format)                                                                   foods#index
POST   /foods(.:format)                                                                         foods#create
food GET    /foods/:id(.:format)                                                                foods#show
PATCH  /foods/:id(.:format)                                                                     foods#update
PUT    /foods/:id(.:format)                                                                     foods#update
DELETE /foods/:id(.:format)                                                                     foods#destroy
root GET    /                                                                                   static#index
</pre>

## Built With

- Ruby - '2.6.3'
- Ruby on Rails '~> 6.0.3', '>= 6.0.3.2'
- PostgreSQL '>= 0.18', '< 2.0'
- Rack-CORS
- Bcrypt '~> 3.1.7'
- RSpec-rails '~> 4.0.0'
- Capybara '>= 2.15'

### Automated Testing with [RSPEC](https://github.com/rspec/rspec-rails)

* Run `bundle exe rspec` within the terminal console after installing project repository.

## Setting up your own Back-End

### Installation

* Download repository to your local machine, then run `bundle install` and run `rails db:setup`, `rails db:migrate` all within the terminal console.

### Navigate to config/initializers directory

1. Enter the cors.rb file and...
2. On line 10 you will replace ```origins 'https://arn-tracking-app.herokuapp.com'``` with your own custom app's url. *(As you can see I used heroku to host my app)*
3. Close the cors.rb file and...
4. Open the session_store.rb file within the same config/initializers directory and...
5. Similar to what you did in the cors.rb file, on line 5 you will replace ```domain: 'arn-tracking-app-api.herokuapp.com'``` with your own custom app's domain.

## Author

👤 **Aaron Rory**

- Github: [@Aaron-RN](https://github.com/Aaron-RN)
- Twitter: [@ARNewbold](https://twitter.com/ARNewbold)
- Linkedin: [Aaron Newbold](https://www.linkedin.com/in/aaron-newbold-1b9233187/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](lic.url) licensed.
