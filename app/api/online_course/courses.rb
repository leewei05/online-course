module OnlineCourse
    class Courses < Grape::API
        version 'v1', using: :path
        format :json
        prefix :api
        
        desc 'Return users information'
        get :users do
            return 'users info'
        end
    end
end