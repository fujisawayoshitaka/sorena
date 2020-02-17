class Comment < ApplicationRecord
  belongs_to :neta
  belongs_to :user
  validates :content,length: { in: 1..140 }
end
