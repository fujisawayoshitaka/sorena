class Station < ApplicationRecord
  has_many :station_user, dependent: :destroy
  has_many :users, through: :station_user
  has_many :station_neta, dependent: :destroy
  has_many :netas, through: :station_neta
end
