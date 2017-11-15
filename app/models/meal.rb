class Meal < ApplicationRecord
  belongs_to :user
  validates :meal_type,  inclusion: { in: ["breakfast", "lunch", "dinner", "supper", "snacks"]}


end
