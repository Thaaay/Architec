class Project < ApplicationRecord
  has_one_attached :images          # Foto principal (capa)
  has_one_attached :panorama_image  # Foto 360º
  has_many :hotspots, dependent: :destroy

  validates :title, :description, presence: true
end