class History < ApplicationRecord
    belongs_to :course

    scope :filter_by_course_type, -> (course_type) { includes(:course).where(courses: {course_type: course_type}) }
end
