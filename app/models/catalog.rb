class Catalog < ApplicationRecord
  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON

  belongs_to :category
  has_many :reviews

  def self.search(params)
    s = Catalog.where("title like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    s = s.where("approved = ?", true)
  end

  validates :title, presence: true, length: {maximum: 30}
  validates :location, presence: true
  validates :phone_number, numericality: { only_integer: true }, length: {9...11}
  validates :description, presence: true, length: {maximum: 140}
  validates :photos, presence: true
  validates :address, presence: true
end
