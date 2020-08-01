class API < Grape::API
    prefix 'api'
    format :json
    
    mount OnlineCourse::Courses
end