# README

# アプリ名
## フリピク

# 本番環境
## http://52.196.52.139/

# テストアカウント
## adress [test@test]
## password [testtest]


# 説明
## 欲しい画像を募集したり、募集されている画像を投稿したりして、求める画像素材を共有し合うサイトです。
## オリジナルの著作権フリー画像を共有し合うので、youtubeやブログ記事などで使う画像を集めることができます。

# 使い方
## ①ヘッダーの新規登録をクリックすることで、ユーザー登録が出来ます。ユーザー登録をしないと、閲覧のみ可能で、サイト内の機能は使えません。

## ②ヘッダーの画像検索で、投稿された全画像の中から画像を検索することができます。

## ③サイトの募集一欄（掲示板）から欲しい画像の募集をかけることができます。また、募集一覧の好きなスレッドをクリックすることで、その詳細画面が見れます。

## ④スレッドの詳細画面ページでは、左のchat spaceがユーザー同士でコミュニケーションを取れる画面になっています。募集する上で必要なコンタクトをユーザー同士で行ってください。右のpicture spaceでは画像を投稿することができます。

## ⑤画像を投稿するページでは、タグをつけることもできます。#をつけてタグを好きな数つけることが可能で、そのタグは画像検索で使われます。

## ⑥作成した募集スレッドや、投稿したチャットや画像は、それを作成したユーザーであれば削除することが可能です。

# 制作した動機
## youtubeで動画を制作していた時に、著作権フリーの画像素材を集めることがより便利になったらいいなと思ったため、このフリピクを作りました。
## また、これからの個人がいろいろな媒体で発信していく時代に、必要性が高いと感じたからです。

# 工夫したポイント
## 画像を投稿する時、ハッシュタグの後に言葉を入れることで、ハッシュタグ以下の言葉が自動的にタグとして付与されるようにしました。
## サイトのカラーを統一させて、サイトのイメージを伝わりやすくしました。
## 直感的な操作ができるサイトを意識し、説明よりもfont awesomeによるアイコンを使うようにした。

# 課題や今後の実装
## もっとjsを使って動きのあるサイトにしていきたい。そして、ユーザーごとのページを作り、ユーザーごとの投稿画像一覧も追加していこうと考えている。

# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, unique: true|
|password|string|null: false|
|username|string|null: false|
### Association
- has_many :posts
- has_many :places
- has_many  :pictures

## placesテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|explanation|text|
|user_id|integer|null: false, foreign_key: true|
### Association
- has_many :posts
- has_many  :pictures
- belongs_to :user


## postsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: true|
|user_id|integer|null: false, foreign_key: true|
|place_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :place


## picturesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|text|text|
|user_id|integer|null: false, foreign_key: true|
|place_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :place
- has_many :pictures_tags
- has_many  :tags,  through:  :pictures_tags

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
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


