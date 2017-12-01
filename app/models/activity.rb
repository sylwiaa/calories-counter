class Activity < ApplicationRecord
  belongs_to :user

  validates :duration, numericality: { greater_than: 0 }
  validates :completed_on, presence: true
  validates :activity_type, presence: true
end
