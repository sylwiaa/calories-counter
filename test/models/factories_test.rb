require 'test_helper'

class FactoriesTest < ActiveSupport::TestCase
  test "all factories are valid" do
    FactoryBot.lint
  end
end
