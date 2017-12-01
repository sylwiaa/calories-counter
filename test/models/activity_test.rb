require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  test 'has valid factory' do
    activity = build(:activity)
    assert_equal true, activity.valid?
  end

  test 'duration validation' do
    activity = build(:activity, duration: 'abc')
    assert_equal false, activity.valid?
  end

  test 'empty duration validation' do
    activity = build(:activity, duration: '')
    assert_equal false, activity.valid?
  end

  test 'negative duration validation' do
    activity = build(:activity, duration: '')
    assert_equal false, activity.valid?
  end

  test 'empty completed_on validation' do
    activity = build(:activity, completed_on: '')
    assert_equal false, activity.valid?
  end

  test 'empty activity_type validation' do
    activity = build(:activity, activity_type: '')
    assert_equal false, activity.valid?
  end
end
