class StationNeta < ApplicationRecord
  belongs_to :station#, optional: true
  belongs_to :neta, optional: true
end
