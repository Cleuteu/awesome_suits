class Suit < ApplicationRecord
  belongs_to :user
  has_many :rentings

  validates :color, presence: true
  validates :size, presence: true
end
