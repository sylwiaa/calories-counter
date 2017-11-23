require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  test "has valid factory" do
    profile = build(:profile)
    assert_equal true, profile.save!
  end

  test "empty gender validation" do
    profile = build(:profile, gender: '')
    assert_equal false, profile.valid?
  end

  test "gender validation" do
    assert_raises do
      build(:profile, gender: 'xyz')
    end
  end

  test "empty date_of_birth validation" do
    profile = build(:profile, date_of_birth: '')
    assert_equal false, profile.valid?
  end

  test "weight validation" do
    profile = build(:profile, weight: 'abc')
    assert_equal false, profile.valid?
  end

  test "0 weight validation" do
    profile = build(:profile, weight: 0)
    assert_equal false, profile.valid?
  end

  test "negative weight validation" do
    profile = build(:profile, weight: -20)
    assert_equal false, profile.valid?
  end

  test "height validation" do
    profile = build(:profile, height: 'xyz')
    assert_equal false, profile.valid?
  end

  test "0 height validation" do
    profile = build(:profile, height: 0)
    assert_equal false, profile.valid?
  end

  test "negative height validation" do
    profile = build(:profile, height: -19)
    assert_equal false, profile.valid?
  end

  test "empty activity_level validation" do
    profile = build(:profile, activity_level: '')
    assert_equal false, profile.valid?
  end

  test "body_mass_index" do
    profile = build(:profile, weight: 65, height: 170)
    assert_equal 38.24, profile.body_mass_index
  end

  test "male basal_metabolic_rate" do
    skip
    profile = build(
      :profile,
      date_of_birth: 23.years.ago,
      weight: 65,
      height: 170,
      gender: 'male'
    )
    assert_equal 1655, profile.basal_metabolic_rate
  end

  test "age" do
    profile = build(:profile, date_of_birth: 23.years.ago)
    assert_equal 23, profile.age
  end
end
