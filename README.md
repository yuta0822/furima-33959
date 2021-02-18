# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| -----------------  | ------ | -------------------------|
| nickname	         | string	| null: false unique: true |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |
| family_name        | string | null: false              |
| first_name         | string | null: false              |
| family_name_kana   | string | null: false              |
| first_name_kana    | string | null: false              |
| birthdate          | date   | null: false              |

### Association
- has_many :orders
- has_many :items

##  orders テーブル

| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one    :address

##  addresses テーブル

| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| home_number   | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association
belongs_to :order

##  items テーブル

| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| explanation   | text       | null: false                    |
| category_id   | integer    | null: false                   |
| condition_id  | integer    | null: false                    |
| postage_id    | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| prepare_id    | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |


### Association

- belongs_to_active_hash :category
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :condition
- belongs_to_active_hash :postage
- belongs_to_active_hash :prepare
- has_one                :order
- belongs_to             :user


