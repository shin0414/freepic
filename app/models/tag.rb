class Tag < ApplicationRecord
  has_many :picture_tags
  has_many :pictures, through: :picture_tags

  def self.search(search)
    if search != ""
      Tag.where('name LIKE(?)', "%#{search}%")
    else
      Tag.all
    end
  end
end
