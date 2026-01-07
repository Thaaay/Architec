class Project < ApplicationRecord
  has_many_attached :images
  has_one_attached :panorama_image
end