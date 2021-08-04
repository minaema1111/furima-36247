# テーブル設計
## users テーブル (ユーザー情報)

| Column             | Type   | Options
| -------------------|--------|
| nickname           | string | null: false
| email              | string | null: false, unique: true
| encrypted-password | string | null: false
| last-name          | string | null: false
| first-name         | string | null: false
| last-name-kana     | string | null: false
| first-name-kana    | string | null: false
| birthday           | date   | null: false

### Association

- has_many :purchases
- has_many :items

## purchases テーブル (購入記録)

| Column  | Type       | Option
| --------|------------| 
| user    | references | null: false, foreign_key: true
| item    | references | null: false, foreign_key: true
| comment | text       |    

### Association

belongs_to :user
belongs_to :item
has_one :address

## items テーブル(商品情報)

| Column      | Type    | Option
| ------------| --------| 
| name        | string  | null: false
| description | text    | null: false
| category    | string  | null: false
| condition   | string  | null: false
| charges     | string  | null: false
| area        | string  | null: false
| days        | string  | null: false
| price       | integer | null: false

### Association

- belongs_to :user
- has_one :purchase

## residences テーブル(発送先住所)

| Column         | Type    | Option
| ---------------|---------|
| postal-code    | string  | null: false
| prefectures    | string  | null: false
| municipalities | string  | null: false
| house-number   | string  | null: false
| building-name  | string  |
| phone-number   | integer | null: false

### Association

- belongs_to :purchase
