class Profile < ApplicationRecord
  enum gender: [:male, :female]

  belongs_to :user

  validates :gender, presence: true
  validates :date_of_birth, presence: true
  validates :weight, numericality: { greater_than: 0 }
  validates :height, numericality: { greater_than: 0 }
  validates :activity_level, inclusion: { in: (1..6)}


  def body_mass_index
    bmi = (weight / (height) * 100).to_f
    bmi.round(2)
  end

  def basal_metabolic_rate
    if gender == "male"
      ppm = 66.5 + (13.75 * weight) + (5.003 * height) - (6.775 * date_of_birth)
    else
      ppm = 665.1 + (9.563 * weight) + (1.85 * height) - (4.676 * date_of_birth)
    end
  end

  def age
    ((Date.today - date_of_birth)/365).to_i
  end
end
