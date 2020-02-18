class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         validates :name, presence: true, length: { maximum: 20 }
         validates :profile, length: { maximum: 200 }
         has_many :netas, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_many :favorite_netas, through: :favorites, source: :neta
         has_many :comments, dependent: :destroy
         has_many :station_user, dependent: :destroy
         has_many :stations, through: :station_user

         before_destroy do
           throw(:abort) if User.where(admin: true).count <= 1 && self.admin?
         end

         before_update do
           throw(:abort) if User.where(admin: true).count <= 1 && self.admin?
         end
end
