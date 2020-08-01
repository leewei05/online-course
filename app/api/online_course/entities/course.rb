module OnlineCourse
    module Entities
     class Course < Grape::Entity
      expose :name
      expose :theme
      expose :price
      expose :currency
     end
    end
end