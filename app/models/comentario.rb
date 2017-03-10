class Comentario < ApplicationRecord
  belongs_to :noticium
  validates :autor, presence: true
  validates :contenido, presence: true
end
