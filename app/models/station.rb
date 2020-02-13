class Station < ApplicationRecord
  has_many :station_user, dependent: :destroy
  has_many :users, through: :station_user
end
