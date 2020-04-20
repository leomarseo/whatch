class Service < ApplicationRecord
  has_many :available_services
  has_many :movies, through: :available_services

  has_one_attached :photo
end
