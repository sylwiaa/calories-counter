require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "has valid factory" do
    category = build(:category)
    assert_equal true, category.valid?
  end

  test "category name validation" do
     product = build(:product, category: nil)
     assert_equal false, product.valid?
  end


end
