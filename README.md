# テーブル設計

## users テーブル

| Column           | Type   | Options                  |
| -----------------| ------ | -------------------------|
| nickname	       | string	| null: false unique: true |
| email            | string | null: false unique: true |
| password         | string | null: false              |
| family_name      | string | null: false              |
| first_name       | string | null: false              |
| family_name_kana | string | null: false              |
| first_name_kana  | string | null: false              |
| birthdate        | date   | null: false              |

### Association
- has_many :seller_items, class_name: 'item', foreign_key: 'seller_id'
- has_many :buyer_items, class_name: 'item', foreign_key: 'buyer_id'
- has_one  :credit_card, dependent: :destroy
- has_one  :delivery_address, dependent: :destroy

## cards テーブル

| Column      | Type          | Options                        |
| ----------- | ------------- | -------------------------------|
| payjp_id    | string        | null: false, unique: true      |
| customer_id | string        | null: false                    |
| user        | references    | null: false, foreign_key: true |

### Association
- belongs_to :user

##  delivery_addresses テーブル

| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| home_number   | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | unique: true                   |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to_active_hash :prefecture

##  items テーブル

| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| explanation   | text       | null: false                    |
| category      | reference  | null: false, foreign_key: true |
| condition_id  | integer    | null: false                    |
| postage_id    | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| prepare_id    | integer    | null: false                    |
| price         | integer    | null: false                    |
| seller        | references | null: false, foreign_key: true |
| buyer         | references | foreign_key: true              |

### Association

belongs_to_active_hash :prefecture
belongs_to_active_hash :condition
belongs_to_active_hash :postage
belongs_to_active_hash :prepare
belongs_to :seller, class_name: 'user', foreign_key: 'seller_id'
belongs_to :buyer, class_name: 'user', foreign_key: 'buyer_id'