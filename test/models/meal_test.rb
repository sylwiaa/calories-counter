require 'test_helper'

class MealTest < ActiveSupport::TestCase
  test "has valid factory" do
    assert build(:meal).save!
  end

  test "quantity vlidation" do
    meal = build(:meal, quantity: "abc")
    assert_equal false, meal.valid?
  end

  test "set_calories_from_product" do
    product = build(:product, calories_per_100: 150)
    meal = build(:meal, product: product, quantity: 300)
    meal.save!
    assert_equal 450, meal.calories
  end

  test "meal type validation" do
    meal = build(:meal, meal_type: 'abc')
    assert_equal false, meal.valid?
  end

  test "0 quantity validation" do
    meal = build(:meal, quantity: 0)
    assert_equal false, meal.valid?
  end

  test "negative quantity validation" do
    meal = build(:meal, quantity: -2)
    assert_equal false, meal.valid?
  end

end
