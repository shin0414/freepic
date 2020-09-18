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
|user_id|integer|null: false, foreign_key: true|
### Association
- has_many :posts
- belongs_to :user


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

## picturesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|place_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :post
- belongs_to :place
- has_many :pictures_tags
- has_many  :tags,  through:  :pictures_tags

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
### Association
- has_many :pictures_tags
- has_many  :pictures,  through:  :pictures_tags

## pictures_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|picture_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :picture
- belongs_to :tag

