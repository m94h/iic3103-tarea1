class Noticium < ApplicationRecord
  has_many :comentarios, ->  {order(created_at: :desc) }, dependent: :destroy
  validates :titulo, presence: true
  validates :bajada, length: { maximum: 250 }

  def self.GetAllOrdered limit = nil
      results = order(created_at: :desc).limit(limit)

      # Cortar el cuerpo en 1000 caracteres
      results.each do |x|
        if x.cuerpo.length >= 1000
          #find last space
          last_space = x.cuerpo[0..1000].rindex(' ') - 1
          x.cuerpo = x.cuerpo[0..last_space] + '...'
        end

      end
  end
end
