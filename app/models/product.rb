class Product < ApplicationRecord
  has_many :meals

  def select_title
    "#{name} (#{calories_per_100} kcal)"
  end
end
