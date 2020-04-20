class Oscar < ApplicationRecord
  belongs_to: :oscarable, polymorphic: true
  belongs_to: :movie
end
