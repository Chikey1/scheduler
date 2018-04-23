class Task < ApplicationRecord
  belongs_to :user
  validates :title,       presence: true, length: { maximum: 20 }
  validates :due_at,      presence: true
end
