module OnlineCourse
    class Histories < Grape::API
        version 'v1', using: :path
        format :json
        prefix :api

        resources :history do
            desc 'Return all histories for specific user.'
            params do
                requires :user_id, type:Integer, desc: 'User ID'
            end
            post do
            status 200

            @histories = History.includes(:course).where("user_id =?", params[:user_id])
            present @histories, with: ::OnlineCourse::Entities::History
            end
        end
    end
end