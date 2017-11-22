require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "has valid factory" do
    product = build(:product)
    assert_equal true, product.valid?
  end

end
