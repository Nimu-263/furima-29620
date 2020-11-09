# テーブル設計

## users テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |

### Association

- has_many :items
- has_one :profile
- has_one :delivery_destination
- has_one :credit_card

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| explanation            | text       | null: false                    |
| category_id            | integer    | null: false                    |
| condition_id           | integer    | null: false                    |
| delivery_fee_burden_id | integer    | null: false                    |
| delivery_source_id     | integer    | null: false                    |
| delivery_days_id       | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user_id                | references | null: false, foreign_key: true |
| buyer_id               | references | null: false, foreign_key: true |
| purchased              | boolean    |                                |

### Association

- belongs_to :user
- belongs_to :category
- belongs_to :condition
- belongs_to :delivery_fee_burden
- belongs_to :delivery_source
- belongs_to :delivery_day

## profiles テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| first_name         | string     | null: false                    |
| family_name        | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| family_name_kana   | string     | null: false                    |
| birth_year_id      | integer    | null: false                    |
| birth_month_id     | integer    | null: false                    |
| birth_day_id       | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :birth_year
- belongs_to :birth_month
- belongs_to :birth_day

## credit_cards テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | integer    | null: false                    |
| expiration_year  | integer    | null: false                    |
| expiration_month | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## delivery_destinations テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :prefecture
