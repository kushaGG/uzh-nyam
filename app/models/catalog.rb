class Catalog < ApplicationRecord
  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON

  belongs_to :category
  has_many :reviews
end
