# README

# Table Design

## users

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| email              | string | null: false, uniqueness: true |
| encrypted_password | string | null: false                   |
| nickname           | string | null: false                   |
| surname            | string | null: false                   |
| name               | string | null: false                   |
| surname_furigana   | string | null: false                   |
| name_furigana      | string | null: false                   |
| date_of_birth      | date   | null: false                   |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## addresses

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false (active hash)      |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :prefecture
- belongs_to :order

## items

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| title                | string     | null: false                    |
| price                | integer    | null: false                    |
| description          | text       | null: false                    |
| condition_id         | integer    | null: false (active hash)      |
| mailing_cost_id      | integer    | null: false (active hash)      |
| mailer_loc_id        | integer    | null: false (active hash)      |
| days_til_post_id     | integer    | null: false (active hash)      |
| category_id          | integer    | null: false (active hash)      |
| in_stock(追加実装用) | boolean    | null: false, foreign_key: true |
| user                 | references | null: false, foreign_key: true |

### Association

- has_one :order
- has_many :comments
- has_many :item_tag_relations
- has_many :brand_tags, through: :item_tag_relations
- belongs_to :user
- belongs_to :condition
- belongs_to :mailing_cost
- belongs_to :prefecture
- belongs_to :days_til_post
- belongs_to :category

## brand_tags

| Column      | Type    | Options                   |
| ----------- | ------- | ------------------------- |
| name        | string  | null: false               |
| category_id | integer | null: false (active hash) |

### Association

- has_many :item_tag_relations
- has_many :items, through: :item_tag_relations
- belongs_to :category

## item_tag_relations （追加実装で使用予定）

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| brand_tag | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :brand_tag

## comments

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## orders

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

# System dependencies

# Ruby Ver

2.6.5

# Configuration

database.yml:
utf8

# Database creation

# Database initialization

# How to run the test suite

# Services (job queues, cache servers, search engines, etc.)

# Deployment instructions

# ...
