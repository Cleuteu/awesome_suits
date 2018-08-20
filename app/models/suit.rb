class Suit < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :rentings

  validates :color, presence: true
  validates :size, presence: true
end
