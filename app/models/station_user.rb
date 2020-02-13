class StationUser < ApplicationRecord
  belongs_to :station, optional: true
  belongs_to :user, optional: true
end
