class Picture < ApplicationRecord
  belongs_to :place
  belongs_to :user
  has_many :picture_tags, dependent: :destroy
  has_many :tags, through: :picture_tags
  mount_uploader :src, ImageUploader

  #DBへのコミット直前に実行
  after_create do
    #1.controller側でcreateしたPictureを取得
    picture = Picture.find_by(id: self.id)
    #2.正規表現を用いて、Pictureのtext内から『#○○○』の文字列を検出
    tags  = self.text.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    #3.mapメソッドでtags配列の要素一つ一つを取り出して、先頭の#を取り除いてDBへ保存する
    tags.uniq.map do |t|
      tag = Tag.find_or_create_by(name: t.downcase.delete('#'))
      picture.tags << tag
    end
  end
end
