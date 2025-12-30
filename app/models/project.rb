class Project < ApplicationRecord
  has_one_attached :image           # Foto principal (capa)
  has_one_attached :panorama_image  # Foto 360º

  validates :title, :description, presence: true
end