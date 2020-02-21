class Station < ApplicationRecord
  has_many :nearest_stations, dependent: :destroy
  has_many :users, through: :nearest_stations, source: :user
  has_many :station_neta, dependent: :destroy, foreign_key: 'station_id'
  has_many :netas, through: :station_neta, source: :neta
  validates :name, presence: true, length: { maximum: 20 }, uniqueness: true
  validates :route, presence: true, length: { maximum: 20 }
  before_destroy do
    throw(:abort) if Station.where(route: "根岸線").count <= 1
  end

  before_update do
    throw(:abort) if Station.where(route: "根岸線").count <= 1
  end
end
