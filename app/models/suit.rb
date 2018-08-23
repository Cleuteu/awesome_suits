class Suit < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :rentings
  has_many :reviews

  validates :name, presence: true
  validates :color, presence: true
  validates :size, presence: true
  validates :price_per_day, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
