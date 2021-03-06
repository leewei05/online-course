module OnlineCourse
    class Courses < Grape::API
        version 'v1', using: :path
        format :json
        prefix :api
        
        resources :courses do
            desc 'Return all courses information.'
            get do
                @courses = Course.all
                present @courses, with: ::OnlineCourse::Entities::Course
            end

            desc 'Return specific course information.'
            route_param :id do
                get do
                @course = Course.find(params[:id])
                present @course, with: ::OnlineCourse::Entities::Course
                end
            end

            desc 'Create a course.'
            params do
                requires :name, type: String, desc: 'Course name'
                requires :user_id, type: Integer, desc: 'User that created the course'
                requires :theme, type: String, desc: 'Course theme'
                requires :course_type, type: String, desc: "Course type"
                requires :price, type: Float, desc: 'Course price'
                requires :currency, type: String, desc: "Currency for the price of the course"
                requires :on_shelf, type: Boolean, desc: "If the course is currently available"
                requires :url, type: String, desc: "Course URL"
                requires :description, type: String, desc: "Course description"
                requires :expire_time, type: Time, desc: "Course expire time"
            end
            post do
                declared_params = declared params, include_missing: false
                Course.create!(declared_params)
            end

            desc 'Update a course.'
            route_param :id do
                put do
                    Course.find(params[:id]).update({ 
                        name: params[:name],
                        user_id: params[:user_id],
                        theme: params[:theme],
                        course_type: params[:course_type],
                        price: params[:price],
                        currency: params[:currency],
                        on_shelf: params[:on_shelf],
                        url: params[:url],
                        description: params[:description],
                        expire_time: params[:expire_time]
                    })
                end
            end

            desc 'Delete a course.'
            route_param :id do
                delete do
                    Course.find(params[:id]).destroy
                end
            end

            desc 'Create a course purchase.'
            params do
                requires :user_id, type: Integer, desc: 'User id'
            end
            post ':course_id/purchases' do
                @course = Course.find(params[:course_id])
                expire = @course.expire_time

                if !@course.on_shelf
                    error! 'This course is not available to purchase!', 400
                end

                History.where(user_id: params[:user_id], course_id: params[:course_id]).each do |t|
                    if t.expired_at > t.purchase_at
                        error! 'You have already purchased this course, and it is available to use!', 400
                    end
                end
                
                History.create!({
                    user_id: params[:user_id],
                    course_id: @course.id,
                    expired_at: Time.now + expire.days,
                    purchase_at: Time.now,
                    price: @course.price,
                    currency: @course.currency,
                    created_at: Time.now.utc,
                    updated_at: Time.now.utc,
                })
            end
        end
    end
end