# online-course

`online-course` is a project that simulates an e-commerce that sales online courses, which is written
in Ruby on Rails.

## Run

```
rails s
```

## Features

```
GET    |  /api/:version/courses(.:format)                       |  v1  |  Return all courses information.        
GET    |  /api/:version/courses/:id(.:format)                   |  v1  |  Return specific course information.    
POST   |  /api/:version/courses(.:format)                       |  v1  |  Create a course.                       
PUT    |  /api/:version/courses/:id(.:format)                   |  v1  |  Update a course.                       
DELETE |  /api/:version/courses/:id(.:format)                   |  v1  |  Delete a course.                       
POST   |  /api/:version/courses/:course_id/purchases(.:format)  |  v1  |  Create a course purchase.              
GET    |  /api/:version/history/:id(.:format)                   |  v1  |  Return all histories for specific user.
```
