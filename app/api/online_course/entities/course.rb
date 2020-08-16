module OnlineCourse
    module Entities
        class Course < Grape::Entity
        expose :id
        expose :name
        expose :user_id
        expose :theme
        expose :course_type
        expose :price
        expose :currency
        expose :on_shelf
        expose :url
        expose :description
        expose :expire_time
        end
    end
end