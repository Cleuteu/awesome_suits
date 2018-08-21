class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :suits, dependent: :destroy
  has_many :rentings, through: :suits
  mount_uploader :photo, PhotoUploader
end
