class API < Grape::API
    prefix 'api'
    format :json
    
    mount OnlineCourse::Courses
    mount OnlineCourse::Histories
end
