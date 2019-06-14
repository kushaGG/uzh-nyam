class Category < ApplicationRecord
  mount_uploader :image, PhotoUploader
  has_many :catalogs

  validates :title, presence: true, uniqueness: true, format: { without: /[!-\/\@\^\~\`\(\)\[\]\>\<\=]/ }
  validates :image, presence: true
end
