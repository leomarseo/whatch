class Service < ApplicationRecord
  has_many :movies, through: :available_services
  has_one_attached :photo
end
