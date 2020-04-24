class Achievement < ApplicationRecord
  has_many :joint_achievements
  has_many :users, through: :joint_achievements


  has_one_attached :photo
end
