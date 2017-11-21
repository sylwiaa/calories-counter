class Meal < ApplicationRecord
  before_save :set_calories_from_product

  belongs_to :user
  belongs_to :product

  validates :meal_type, inclusion: { in: ["breakfast", "lunch", "dinner", "supper", "snacks"]}
  validates :quantity, numericality: true

  def set_calories_from_product
    self.calories = product.calories_per_100 * quantity / 100
  end

  def name
    product.name
  end

  def category
    product.category.name
  end
end
