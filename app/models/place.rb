class Place < ApplicationRecord
  validates :title, presence: true
  has_many :posts
  has_many :pictures
end
