class Project < ApplicationRecord
  has_one_attached :image
  has_many_attached :photos
  has_one_attached :tour_360

  validates :title, presence: true
  validates :description, presence: true
end