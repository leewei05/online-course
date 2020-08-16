module OnlineCourse
    module Entities
        class History < Grape::Entity
            expose :user_id
            expose :purchase_at
            expose :price
            expose :currency
            expose :created_at
            expose :updated_at
        end
    end
end