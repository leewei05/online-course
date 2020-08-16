module OnlineCourse
    module Entities
        class History < Grape::Entity
            expose :user_id
            expose :purchase_at
            expose :price
            expose :currency
            expose :course, with: OnlineCourse::Entities::Course
            expose :created_at
            expose :updated_at
        end
    end
end