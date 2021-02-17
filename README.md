# DB 設計

## users table

| Column             | Type                | Options                              |
|--------------------|---------------------|--------------------------------------|
| nickname           | string              | null: false                          |
| email              | string              | null: false                          |
| password           | string              | null: false                          |
| family_name        | string              | null: false                          |
| first_name         | sting               | null: false                          |
| family_name_kana   | string              | null: false                          |
| first_name_kana    | string              | null: false                          |
| birthday_date      | date                | null: false, foreign_key: true       |


### Association

* has_many :products  
* has_many :purchase_records

## products table

| Column             | Type                | Options                              |
|--------------------|---------------------|--------------------------------------|
| name               | string              | null: false                          |
| description        | text                | null: false                          |
| category_id        | integer             | null: false                          |
| condition_id       | integer             | null: false                          |
| shipping_cost_id   | integer             | null: false                          |
| prefecture_id      | integer             | null: false                          |
| shipping_days_id   | integer             | null: false                          |
| price              | integer             | null: false                          |
| user_id            | references          | foreign_key: true                    |


### Association

* belongs_to :user
* has_one :purchase_record

## purchase_records table

| Column             | Type                | Options                              |
|--------------------|---------------------|--------------------------------------|
| product            | references          | null: false, foreign_key: true       |
| user               | references          | null: false, foreign_key: true       |


### Association

* has_one :address
* belongs_to :user
* belongs_to :product


## addresses

| Column             | Type                | Options                              |
|--------------------|---------------------|--------------------------------------|
| postal_code        | string              | null: false                          |
| prefecture_id      | integer             | null: false                          |
| city               | string              | null: false                          |
| address            | string              | null: false                          |
| building_name      | string              |                                      |
| phone_number       | string              | null: false                          |
| purchase_record    | references          | null: false, foreign_key: true       |

### Association

* belongs_to purchase_record





