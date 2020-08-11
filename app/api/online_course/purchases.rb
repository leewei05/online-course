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
                    expire = @course.expire_time

                    if !@course.on_shelf
                        error! 'This course is not available to purchase!', 400
                    end

                    History.where(user_id: params[:user_id], course_id: params[:id]).each do |t|
                        expire_date = t.purchase_at + expire.days
                        if expire_date > t.purchase_at
                            error! 'You have already purchased this course, and it is available to use!', 400
                        end
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