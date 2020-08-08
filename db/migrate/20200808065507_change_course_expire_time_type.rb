class ChangeCourseExpireTimeType < ActiveRecord::Migration[5.2]
  def change
    change_column :courses, :expire_time, :integer
  end
end
