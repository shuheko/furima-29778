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

| Column      | Type   | Options     |
| --------    | ------ | ----------- |
| name        | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| first_name  | string | null: false |
| family_name | string | null: false |

### Association

- has_many :items
- has_many :comments
- belongs_to :address


## items テーブル

| Column      | Type   | Options     |
| ------      | ------ | ----------- |
| image       | string | null: false |
| name        |
| explanation |
| category    |
| status      |
| shipping    |
| area        |
| days        |
| price       |

### Association

- belongs_to :users
- has_many :comments

## coments テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| text   | string     | null: false |


### Association

- belongs_to :items
- belongs_to :users

## address テーブル

| Column       | Type       | Options     |
| -------      | ---------- | ----------- |
| zip_code     | string     | null: false |
| prefecture   | string     | null: false |
| city         | string     | null: false |
| house_number | string     | null: false |
| building     | string     | null: false |

### Association

- belongs_to :user