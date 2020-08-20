class Base < Grape::API
    version 'v1'
    prefix 'api'
    format :json

    mount OnlineCourse::Courses
    mount OnlineCourse::Histories
end