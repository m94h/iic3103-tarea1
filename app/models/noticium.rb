class Noticium < ApplicationRecord
  validates :titulo, presence: true
  validates :bajada, length: { maximum: 250 }
end
