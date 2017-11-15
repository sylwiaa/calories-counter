class CreateMeals < ActiveRecord::Migration[5.1]
  def change
    create_table :meals do |t|
      t.integer :user_id
      t.string :name
      t.integer :quantity
      t.integer :calories
      t.string :category
      t.date :eaten_on
      t.string :meal_type

      t.timestamps
    end
  end
end
