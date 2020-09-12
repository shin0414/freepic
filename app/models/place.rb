class Place < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :posts
  has_many :pictures
end
