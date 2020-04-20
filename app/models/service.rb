class Service < ApplicationRecord
  has_many :movies, through: :available_services
end
