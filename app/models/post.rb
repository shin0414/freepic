class Post < ApplicationRecord
  belongs_to :place
  belongs_to :user
  has_many :images
end
