module OnlineCourse
    class Histories < Grape::API
        version 'v1', using: :path
        format :json
        prefix :api

        resources :history do
            desc 'Return all histories for specific user.'
            route_param :id do
                get do
                # @user_id = params[:buyer_id]
                # @history = History.find(@user_id)
                @history = History.all()
                present @history, with: ::OnlineCourse::Entities::History
                end
            end
        end
    end
end