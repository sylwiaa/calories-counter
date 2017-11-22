require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "has valid factory" do
    assert build(:user).save!
  end
end
