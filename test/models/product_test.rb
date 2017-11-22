require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "has valid factory" do
    product = build(:product)
    assert_equal true, product.valid?
  end


end
