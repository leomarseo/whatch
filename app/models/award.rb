class Award < ApplicationRecord
  belongs_to :awardable, polymorphic: true
  belongs_to :movie
end
