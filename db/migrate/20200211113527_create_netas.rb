class CreateNetas < ActiveRecord::Migration[5.2]
  def change
    create_table :netas do |t|
      t.text :image
      t.text :content

      t.timestamps
    end
  end
end
