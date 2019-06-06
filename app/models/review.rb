class Review < ApplicationRecord
  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON # If you use SQLite, add this line.

  belongs_to :user
  belongs_to :catalog
  validates :comment, presence: true
  validates :rating, presence: true
end
