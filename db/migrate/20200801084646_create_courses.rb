class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :user_id
      t.string :theme
      t.float :price
      t.string :currency
      t.string :course_type
      t.boolean :on_shelf
      t.string :url
      t.text :description
      t.time :expire_time

      t.timestamps
    end
  end
end
