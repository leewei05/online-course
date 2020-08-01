module OnlineCourse
    class Courses < Grape::API
        version 'v1', using: :path
        format :json
        prefix :api
        
        resources :course do
            desc 'Return courses information'
            get do
                @courses = Course.all
                present @courses, with: ::OnlineCourse::Entities::Course
            end
        end

        desc 'Return a specific course'
        route_param :id do
            get do
            course = Course.find(params[:id])
            present course
            end
        end
    end
end