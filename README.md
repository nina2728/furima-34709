# テーブル設計

## usersテーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| email      | string  | null: false |
| password   | string  | null: false |
| nickname   | string  | null: false |
| name_kanji | string  | null: false |
| name_kana  | string  | null: false |
| dob        | integer | null: false |

### Association

- has_many :items
- has_many :buys

## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| i_name        | text       | null: false                    |
| i_description | text       | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| delivery      | string     | null: false                    |
| area          | string     | null: false                    |
| days          | integer    | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buy

## buysテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buy
- has_one    :receiver

## receiversテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| buy_id        | references | null: false, foreign_key: true |

## Association

- has_one :buy