require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  test 'has valid factory' do
    profile = build(:profile)
    assert_equal true, profile.save!
  end

  test 'empty gender validation' do
    profile = build(:profile, gender: '')
    assert_equal false, profile.valid?
  end

  test 'gender validation' do
    assert_raises do
      build(:profile, gender: 'xyz')
    end
  end

  test 'empty date_of_birth validation' do
    profile = build(:profile, date_of_birth: '')
    assert_equal false, profile.valid?
  end

  test 'weight validation' do
    profile = build(:profile, weight: 'abc')
    assert_equal false, profile.valid?
  end

  test '0 weight validation' do
    profile = build(:profile, weight: 0)
    assert_equal false, profile.valid?
  end

  test 'negative weight validation' do
    profile = build(:profile, weight: -20)
    assert_equal false, profile.valid?
  end

  test 'height validation' do
    profile = build(:profile, height: 'xyz')
    assert_equal false, profile.valid?
  end

  test '0 height validation' do
    profile = build(:profile, height: 0)
    assert_equal false, profile.valid?
  end

  test 'negative height validation' do
    profile = build(:profile, height: -19)
    assert_equal false, profile.valid?
  end

  test 'empty activity_level validation' do
    profile = build(:profile, activity_level: '')
    assert_equal false, profile.valid?
  end

  test 'body_mass_index' do
    profile = create(:profile, weight: 65, height: 170)
    assert_equal 38.24, profile.body_mass_index
  end

  test 'male basal_metabolic_rate' do
    profile = create(
      :profile,
      date_of_birth: 23.years.ago,
      weight: 65,
      height: 170,
      gender: 'male'
    )
    assert_equal 1655, profile.basal_metabolic_rate
  end

  test 'female basal_metabolic_rate' do
    profile = create(
      :profile,
      date_of_birth: 22.years.ago,
      weight: 60,
      height: 165,
      gender: 'female'
    )
    assert_equal 1441, profile.basal_metabolic_rate
  end

  test 'age' do
    profile = create(:profile, date_of_birth: 23.years.ago)
    assert_equal 23, profile.age
  end

  test 'activity_factor' do
    assert_equal 1.25, create(:profile, activity_level: 0).activity_factor
    assert_equal 1.4,  create(:profile, activity_level: 1).activity_factor
    assert_equal 1.6,  create(:profile, activity_level: 2).activity_factor
    assert_equal 1.75, create(:profile, activity_level: 3).activity_factor
    assert_equal 2.0,  create(:profile, activity_level: 4).activity_factor
    assert_equal 2.3,  create(:profile, activity_level: 5).activity_factor
  end

  test 'total_metabolic_rate' do
    profile = create(
      :profile,
      gender: 'male',
      weight: 100,
      height: 180,
      date_of_birth: 32.years.ago,
      activity_level: 3
    )
    assert_equal 3719, profile.total_metabolic_rate
  end

  test 'today_balance' do
    profile = create(
      :profile,
      gender: 'male',
      weight: 100,
      height: 180,
      date_of_birth: 32.years.ago,
      activity_level: 3
    )

    product = create(:product, calories_per_100: 30)

    create(:meal, product: product, user: profile.user, quantity: 100, eaten_on: Date.today)
    create(:meal, product: product, user: profile.user, quantity: 100, eaten_on: 1.day.ago)
    create(:meal, product: product, user: create(:user), quantity: 100, eaten_on: Date.today)

    assert_equal -3689, profile.today_balance
  end
end
