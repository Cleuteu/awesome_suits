class Renting < ApplicationRecord
  belongs_to :user
  belongs_to :suit
  has_many :reviews

  validates :user_id, presence: true
  validates :suit_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true


end
