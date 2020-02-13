class CreateStationNetas < ActiveRecord::Migration[5.2]
  def change
    create_table :station_netas do |t|
      t.references :station, foreign_key: true
      t.references :neta, foreign_key: true

      t.timestamps
    end
  end
end
