class Event < ApplicationRecord
  belongs_to :user
  validates :title,       presence: true, length: { maximum: 20 }
  validates :starts_at,   presence: true
  validates :ends_at,     presence: true
  validates :day,         presence: true
  validates :category,    presence: true
  validate :time_constraints

private
  def time_constraints
    if !(starts_at < ends_at)
      errors.add(:starts_at, "must be before ends at")
    end
  end
end
