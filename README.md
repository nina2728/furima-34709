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
- has_one  :buy

## itemsテーブル

| Column | Type | Options |
| ------ | ---- | ------- |
| image | 

