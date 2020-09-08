# README

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false|
|username|string|null: false|
### Association
- has_many :posts

## placesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|explanation|text|
### Association
- has_many :posts


## postsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: true|
|image_id|integer|null: true, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
|place_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :place
- has_many :images_tags

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|posts_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- has_many :images_tags
- has_many  :tags,  through:  :images_tags

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
### Association
- has_many :images_tags
- has_many  :images,  through:  :images_tags

## images_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|image_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :image
- belongs_to :tag

