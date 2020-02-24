class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :neta
  validates :user_id, presence: true
  validates :neta_id, presence: true
  validates :user_id, uniqueness: { scope: :neta_id }
end
