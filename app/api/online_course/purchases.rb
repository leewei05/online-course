module OnlineCourse
    class Purchases < Grape::API
        version 'v1', using: :path
        format :json
        prefix :api

        resources :purchase do
            desc 'Create a purchase.'
            route_param :id do
                params do
                    requires :user_id, type: Integer, desc: 'User id'
                end
                post do
                    @course = Course.find(params[:id])
                    if !@course.on_shelf
                        error! 'This course is not available to purchase!', 400
                    end
                    History.create!({
                        user_id: params[:user_id],
                        course_id: @course.id,
                        purchase_at: Time.now.strftime("%Y-%m-%d"),
                        price: @course.price,
                        currency: @course.currency
                    })
                end
            end
        end
    end
end