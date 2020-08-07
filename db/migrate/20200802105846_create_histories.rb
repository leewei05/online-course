class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :course_id
      t.date :purchase_date
      t.float :price
      t.string :currency

      t.timestamps
    end
  end
end
