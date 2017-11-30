class Product < ApplicationRecord
  has_many :meals
  belongs_to :category
  belongs_to :user, optional: true
  validates :name, presence: true
  validates :calories_per_100, numericality: { greater_than: 0 }

  def self.for_user(user)
    self.where(user_id: user.id) + self.where(user_id: nil)
  end

  def select_title
    "#{name} (#{calories_per_100} kcal)"
  end
end
