class Product < ApplicationRecord
  has_many :meals
  belongs_to :category
  validates :name, presence: true
  validates :calories_per_100, numericality: { greater_than: 0 }

  def select_title
    "#{name} (#{calories_per_100} kcal)"
  end
end
