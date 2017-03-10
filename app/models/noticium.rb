class Noticium < ApplicationRecord
  has_many :comentarios, ->  {order(created_at: :desc) }, dependent: :destroy
  validates :titulo, presence: true
  validates :bajada, length: { maximum: 250 }
end
