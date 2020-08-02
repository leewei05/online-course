module OnlineCourse
    class Courses < Grape::API
        version 'v1', using: :path
        format :json
        prefix :api
        
        resources :course do
            desc 'Return all courses information.'
            get :all do
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
                Course.create!({
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
        end
    end
end