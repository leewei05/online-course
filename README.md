# online-course

`online-course` is a project that simulates a platform that sales online courses, which is written
in Ruby on Rails.

## Run

```
rails s
```

## Features

### APIs

```
# These are not requirements
GET    |  /api/:version/courses(.:format)                       |  v1  |  Return all courses information.        
GET    |  /api/:version/courses/:id(.:format)                   |  v1  |  Return specific course information.    
POST   |  /api/:version/courses(.:format)                       |  v1  |  Create a course.                       
PUT    |  /api/:version/courses/:id(.:format)                   |  v1  |  Update a course.                       
DELETE |  /api/:version/courses/:id(.:format)                   |  v1  |  Delete a course.    

# These are requirements
POST   |  /api/:version/courses/:course_id/purchases(.:format)  |  v1  |  Create a course purchase.              
POST   |  /api/:version/histories/:id(.:format)                 |  v1  |  Return all histories for specific user.
```

## How to test features

### Admin Panel

Create two types of Users for Admin console:

1. Admin: Can manage all resources on Admin console except history, because it is too weird to update user's purchase histories
1. User: Cannot read anything from Admin console 

```
Admin Url
http://localhost:3000/

Admin 
account: admin@gmail.com
password: 123456

User
account: user@gmail.com
password: 123456
```

### Purchases

1. Create a purchase history after successfully purchased the course
1. User cannot purchase a course if its not available
1. User cannot re-purchase a course if he/she already purchased the course and the course hasn't expired

```
# User(id = 2) created a purchase for course(id = 4)
curl -X POST http://localhost:3000/api/v1/courses/4/purchases -H 'Content-Type: application/json' -d '{"user_id":2}'

# User(id = 2) created a purchase for course(id = 3), course_id = 3 is not available to purchase
curl -X POST http://localhost:3000/api/v1/courses/3/purchases -H 'Content-Type: application/json' -d '{"user_id":2}'

400 Bad Request
{"error":"This course is not available to purchase!"}

# User(id = 2) created a purchase for course(id = 4), but he/she has already purchased the course
curl -X POST http://localhost:3000/api/v1/courses/4/purchases -H 'Content-Type: application/json' -d '{"user_id":2}'

400 Bad Request
{"error":"You have already purchased this course, and it is available to use!"}
```

### Histories

Requirements:

1. Return all purchase histories of a user
1. Return information needs to include payment information
1. User can filter typical course type of histories
1. User can filter courses that are still available to use

```
# Return all histories for User(id = 2) including course and payment information 
curl -X POST http://localhost:3000/api/v1/histories -H 'Content-Type: application/json' -d '{"user_id":2}'

# Filter course type "Tech" for User(id = 2)
curl -X POST http://localhost:3000/api/v1/histories -H 'Content-Type: application/json' -d '{"user_id":2, "course_type":"Tech"}'

# Filter courses that are still available to use for User(id = 2)
curl -X POST http://localhost:3000/api/v1/histories -H 'Content-Type: application/json' -d '{"user_id":2, "available":true}'

# Filter courses that are not available to use for User(id = 2)
curl -X POST http://localhost:3000/api/v1/histories -H 'Content-Type: application/json' -d '{"user_id":2, "available":false}'
```
