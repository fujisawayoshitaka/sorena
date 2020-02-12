class AddUserRefToNetas < ActiveRecord::Migration[5.2]
  def change
    add_reference :netas, :user, foreign_key: true
  end
end
