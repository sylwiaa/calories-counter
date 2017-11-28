class Profile < ApplicationRecord
  enum gender: [:male, :female]

  belongs_to :user

  validates :gender, presence: true
  validates :date_of_birth, presence: true
  validates :weight, numericality: { greater_than: 0 }
  validates :height, numericality: { greater_than: 0 }
  validates :activity_level, inclusion: { in: (0..5) }

  def body_mass_index
    (weight / height * 100).round(2)
  end

  def basal_metabolic_rate
    if gender == 'male'
      (66.5 + (13.75 * weight) + (5.003 * height) - (6.775 * age)).round
    else
      (665.1 + (9.563 * weight) + (1.85 * height) - (4.676 * age)).round
    end
  end

  def age
    ((Date.today - date_of_birth) / 365).to_i
  end

  def activity_factor
    case activity_level
    when 0 then 1.25
    when 1 then 1.4
    when 2 then 1.6
    when 3 then 1.75
    when 4 then 2.0
    when 5 then 2.3
    end
  end


  def total_metabolic_rate
    (basal_metabolic_rate * activity_factor).round
  end
end
