class RemoveNameCategoryFromMeals < ActiveRecord::Migration[5.1]
  def change
    remove_column :meals, :name, :string
    remove_column :meals, :category, :string
  end
end
