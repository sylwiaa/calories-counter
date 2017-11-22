require 'test_helper'

class MealTest < ActiveSupport::TestCase
  test "has valid factory" do
    meal = build(:meal)
    assert_equal true, meal.valid?
  end

  test "quantity vlidation" do
    meal = build(:meal, quantity: "abc")
    assert_equal false, meal.valid?
  end

end
