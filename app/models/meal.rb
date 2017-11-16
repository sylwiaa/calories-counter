class Meal < ApplicationRecord
  before_save :set_name_from_product
  before_save :set_calories_from_product
  
  belongs_to :user
  belongs_to :product  
  
  validates :meal_type, inclusion: { in: ["breakfast", "lunch", "dinner", "supper", "snacks"]}
  validates :quantity, numericality: true

  def set_name_from_product
    self.name = product.name
  end

  def set_calories_from_product
    self.calories = product.calories_per_100 * quantity / 100
  end

end
