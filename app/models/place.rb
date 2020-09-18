class Place < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :pictures, dependent: :destroy
end
