class Review < ApplicationRecord
  belongs_to :renting
  belongs_to :user

  validates :rate, presence: true
  validates :renting_id, presence: true
  validates :user_id, presence: true
  validates :date, presence: true
  validates :title, presence: true
end
