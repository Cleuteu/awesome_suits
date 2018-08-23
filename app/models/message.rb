class Message < ApplicationRecord
  belongs_to :renting
  belongs_to :user

  validates :user_id, presence: true
  validates :renting_id, presence: true
  validates :date, presence: true
  validates :content, presence: true
end
