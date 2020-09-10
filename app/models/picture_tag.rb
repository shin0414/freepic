class PictureTag < ApplicationRecord
  belongs_to :picture
  belongs_to :tag
  validates :picture_id, presence: true
  validates :tag_id, presence: true
end
