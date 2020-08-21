module OnlineCourse
    class Histories < Grape::API
        version 'v1', using: :path
        format :json
        prefix :api

        helpers do
            def declared_params
                @declared_params ||= declared params, include_missing: false
            end

            def course_type_filter(histories)
                histories = histories.filter_by_course_type(declared_params[:course_type]) unless declared_params[:course_type].nil?
                return histories
            end
    
            def available_filter(histories)
                return histories if declared_params[:available].nil?
    
                if declared_params[:available] == true
                    histories = histories.available
                elsif declared_params[:available] == false
                    histories = histories.unavailable
                end
    
                return histories
            end
        end

        resources :histories do
            desc 'Return all histories for specific user.'
            params do
                requires :user_id, type:Integer, desc: 'User ID'
                optional :course_type, type:String, desc: 'Types of courses'
                optional :available, type:Boolean, desc: 'Courses that are still available'
            end
            post do
            status 200

            histories = course_type_filter available_filter History.includes(:course).where(user_id: declared_params[:user_id])

            present histories, with: ::OnlineCourse::Entities::History
            end
        end
    end
end