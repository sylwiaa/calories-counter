require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "has valid factory" do
    product = build(:product)
    assert_equal true, product.valid?
  end

  test "empty name" do
    product = build(:product, name: '')
    assert_equal false, product.valid?
  end

  test "select_title" do
    product = build(:product, name: "buraki", calories_per_100: 30)
    assert_equal "buraki (30 kcal)", product.select_title
  end

  test "zero number calories" do
    product = build(:product, calories_per_100: 0)
    assert_equal false, product.valid?
  end

  test "negative number calories" do
    product = build(:product, calories_per_100: -19)
    assert_equal false, product.valid?
  end
end
