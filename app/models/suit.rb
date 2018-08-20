class Suit < ApplicationRecord
  belongs_to :user

  validates :color, presence: true
  validates :size, presence: true
end
