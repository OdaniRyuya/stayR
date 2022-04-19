class Room < ApplicationRecord
  mount_uploader :image, ImageUploader 
  belongs_to :user, optional: true
  has_many :reservations
  validates :title, presence: true
  validates :comment, presence: true
  validates :address, presence: true
  validates :price, presence: true, numericality: true, length: { minimum: 1, maximum: 8 } 
  validates :image, presence: true
end
