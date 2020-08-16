class CourseForeignKeyForModelHistory < ActiveRecord::Migration[5.2]
  def change
    remove_column :histories, :course_id
    add_reference :histories, :course, index: true
  end
end
