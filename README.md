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

## Built With

- Ruby - '2.6.3'
- Ruby on Rails '~> 6.0.3', '>= 6.0.3.2'
- PostgreSQL '>= 0.18', '< 2.0'
- Rack-CORS
- Bcrypt '~> 3.1.7'

## Future plans
Add in RSpec testing for database data validations and association testing.

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
