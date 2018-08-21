class Suit < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :rentings

  validates :name, presence: true
  validates :color, presence: true
  validates :size, presence: true
  validates :price_per_day, presence: true
end
