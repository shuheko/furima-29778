# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column            | Type    | Options     |
| --------          | ------  | ----------- |
| users_id          | string  | null: false |
| name              | string  | null: false |
| email             | string  | null: false |
| password          | string  | null: false |
| first_name        | string  | null: false |
| family_name       | string  | null: false |
| first_name_kana   | string  | null: false |
| family_name_kana  | string  | null: false |
| birthday          | date    | null: false |


### Association

- has_many :items
- has_many :comments
- belongs_to :order


## items テーブル

| Column      | Type    | Options     |
| ------      | ------  | ----------- |
| name        | string  | null: false |
| explanation | text    | null: false |
| category_id | integer | null: false |
| status_id   | integer | null: false |
| shipping_id | integer | null: false |
| area_id     | integer | null: false |
| days_id     | integer | null: false |
| price       | integer | null: false |

### Association

- belongs_to :user
- has_many :comments
- belongs_to :order

## coments テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | -----------                    |
| text    | string     | null: false                    |
| item_id | string     | null: false, foreign_key: true |
| user_id | string     | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user

## address テーブル

| Column        | Type       | Options     |
| -------       | ---------- | ----------- |
| zip_code      | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| house_number  | string     | null: false |
| building      | string     |             |
| phone_number  | string     | null: false |

### Association

- belongs_to :order

## orderテーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| users   | string     | null: false, foreign_key: true |
| items   | string     | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item