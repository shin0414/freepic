class Picture < ApplicationRecord
  belongs_to :place
  has_many :picture_tags
  has_many :tags, through: :picture_tags
  mount_uploader :src, ImageUploader

  # after_create do
  #   picture = Picture.find_by(id: id)
  #   # hashbodyに打ち込まれたハッシュタグを検出
  #   tags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
  #   tags.uniq.map do |tag|
  #     # ハッシュタグは先頭の#を外した上で保存
  #     t = Tag.find_or_create_by(name: tag.downcase.delete('#'))
  #     picture.tags << t
  #   end
  # end
  # #更新アクション
  # before_update do
  #   picture = Picture.find_by(id: id)
  #   picture.tags.clear
  #   tags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
  #   tags.uniq.map do |tag|
  #     t = Tag.find_or_create_by(name: tag.downcase.delete('#'))
  #     post_image.hashtags << t
  #   end
  # end
end
