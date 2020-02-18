class StationUsersToNearestStations < ActiveRecord::Migration[5.2]
  def change
    rename_table :station_users, :nearest_stations
  end
end
