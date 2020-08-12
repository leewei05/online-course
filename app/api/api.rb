class API < Grape::API
    prefix 'api'
    format :json
    default_error_status 400

    mount OnlineCourse::Courses
    mount OnlineCourse::Histories
end
