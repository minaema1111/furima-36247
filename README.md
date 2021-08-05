# テーブル設計
## users テーブル (ユーザー情報)

| Column             | Type   | Options
| -------------------|--------|
| nickname           | string | null: false
| email              | string | null: false, unique: true
| encrypted_password | string | null: false
| last_name          | string | null: false
| first_name         | string | null: false
| last_name_kana     | string | null: false
| first_name_kana    | string | null: false
| birthday           | date   | null: false

### Association

- has_many :purchases
- has_many :items

## purchases テーブル (購入記録)

| Column  | Type       | Option
| --------|------------| 
| user    | references | null: false, foreign_key: true
| item    | references | null: false, foreign_key: true

### Association

belongs_to :user
belongs_to :item
has_one :residence

## items テーブル(商品情報)

| Column       | Type       | Option
| -------------| --------   | 
| user         | references | null: false, foreign_key: true
| name         | string     | null: false
| description  | text       | null: false
| category_id  | integer    | null: false
| condition_id | integer    | null: false
| charge_id   | integer    | null: false
| area_id      | integer    | null: false
| day_id      | integer    | null: false
| price        | integer    | null: false

### Association

- belongs_to :user
- has_one :purchase

## residences テーブル(発送先住所)

| Column         | Type       | Option
| ---------------|------------|
| purchase       | references | null: false, foreign_key: true
| postal_code    | string     | null: false
| area_id        | integer    | null: false
| municipalities | string     | null: false
| house_number   | string     | null: false
| building_name  | string     |
| phone_number   | string     | null: false

### Association

- belongs_to :purchase
