class Category < ApplicationRecord
  mount_uploader :image, PhotoUploader
  has_many :catalogs
end
