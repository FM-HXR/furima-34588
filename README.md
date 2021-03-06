# README

# Table Design

## users

| Column        | Type   | Options                       |
| ------------- | ------ | ----------------------------- |
| email         | string | null: false, uniqueness: true |
| password      | string | null: false                   |
| nickname      | string | null: false                   |
| full_name     | string | null: false                   |
| yomigana      | string | null: false                   |
| date_of_birth | date   | null: false                   |

### Association

- has_one :address
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
| building      | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- has_one :user
- belongs_to :prefecture

## items

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| price         | bigint     | null: false                    |
| description   | text       | null: false                    |
| condition_id  | integer    | null: false (active hash)      |
| mailing       | string     | null: false                    |
| delivery_time | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| category_id   | integer    | null: false (active hash)      |

### Association

- has_one :order
- has_many :comments
- has_many :item_tag_relations
- has_many :brand_tags, through: :item_tag_relations
- belongs_to :user
- belongs_to :condition
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

## item_tag_relations

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

- has_one :item
- belongs_to :user

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
