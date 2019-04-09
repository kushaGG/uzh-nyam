class Catalog < ApplicationRecord
  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON # If you use SQLite, add this line.

  belongs_to :category
  has_many :reviews
end
