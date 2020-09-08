class Picture < ApplicationRecord
  belongs_to :place
  has_many :picture_tags
  has_many :tags, through: :picture_tags
  mount_uploader :src, ImageUploader
end
