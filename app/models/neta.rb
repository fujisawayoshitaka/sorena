class Neta < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :content, presence: true, length: { maximum: 50 }
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  has_many :station_neta, dependent: :destroy, foreign_key: 'neta_id'
  has_many :stations, through: :station_neta, source: :station
  scope :desc_created, -> {order(created_at: :desc)}

end
