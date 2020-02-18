class Station < ApplicationRecord
  has_many :nearest_stations, dependent: :destroy
  has_many :users, through: :nearest_stations, source: :user
  has_many :station_neta, dependent: :destroy, foreign_key: 'station_id'
  has_many :netas, through: :station_neta, source: :neta
end
