class AvailableService < ApplicationRecord
  belongs_to :movie
  belongs_to :service
end
