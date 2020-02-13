class CreateStationUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :station_users do |t|
      t.references :station, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
