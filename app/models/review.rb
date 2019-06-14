class Review < ApplicationRecord
  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON

  belongs_to :user
  belongs_to :catalog

  validates :comment, length: {maximum: 140}
  validates :rating, presence: true
end
