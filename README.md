# sample-fullstack-app

![image](./docs/architecture.drawio.png)

## Requirements

| runtime | version             |
| ------- | ------------------- |
| node    | see `.node-version` |
| yarn    | 1.22.19             |

## Getting Started

```bash:
yarn
```

### ページのパス一覧 (Next.js)

#### 公開ページ

- `/` - ホームページ
- `/signup` - サインアップページ
- `/login` - ログインページ
- `/products` - 商品一覧ページ
- `/products/[id]` - 商品詳細ページ (動的ルート)
- `/cart` - カートページ
- `/profile` - ユーザープロフィールページ
- `/orders` - 注文履歴ページ

#### 管理ページ

- `/admin` - 管理ダッシュボード
- `/admin/products` - 商品管理ページ
- `/admin/products/new` - 商品登録ページ
- `/admin/products/[id]` - 商品編集ページ (動的ルート)

### APIのエンドポイント一覧 (Express)

#### 認証関連

- `POST /api/auth/signup` - サインアップ
- `POST /api/auth/login` - ログイン
- `POST /api/auth/logout` - ログアウト

#### 商品関連

- `GET /api/products` - 商品一覧取得
- `GET /api/products/:id` - 商品詳細取得
- `POST /api/products` - 商品登録 (管理者用)
- `PUT /api/products/:id` - 商品更新 (管理者用)
- `DELETE /api/products/:id` - 商品削除 (管理者用)

#### カート関連

- `GET /api/cart` - カート内容取得
- `POST /api/cart` - カートに商品追加
- `PUT /api/cart/:id` - カート内商品の数量変更
- `DELETE /api/cart/:id` - カートから商品削除

#### 注文関連

- `POST /api/orders` - 注文作成
- `GET /api/orders` - 注文履歴取得

#### レビュー関連

- `POST /api/reviews` - レビュー投稿
- `GET /api/reviews/:productId` - 商品のレビュー取得

### テーブル設計

#### ユーザーテーブル (users)

| カラム名      | データ型 | 説明                 |
| ------------- | -------- | -------------------- |
| id            | UUID     | ユーザーID           |
| name          | String   | ユーザー名           |
| email         | String   | メールアドレス       |
| password_hash | String   | パスワードのハッシュ |
| created_at    | DateTime | 作成日時             |
| updated_at    | DateTime | 更新日時             |

#### 商品テーブル (products)

| カラム名       | データ型 | 説明     |
| -------------- | -------- | -------- |
| id             | UUID     | 商品ID   |
| name           | String   | 商品名   |
| description    | Text     | 商品説明 |
| price          | Decimal  | 価格     |
| stock_quantity | Int      | 在庫数量 |
| created_at     | DateTime | 作成日時 |
| updated_at     | DateTime | 更新日時 |

#### 注文テーブル (orders)

| カラム名     | データ型 | 説明       |
| ------------ | -------- | ---------- |
| id           | UUID     | 注文ID     |
| user_id      | UUID     | ユーザーID |
| total_amount | Decimal  | 合計金額   |
| created_at   | DateTime | 作成日時   |

#### 注文明細テーブル (order_items)

| カラム名   | データ型 | 説明       |
| ---------- | -------- | ---------- |
| id         | UUID     | 注文明細ID |
| order_id   | UUID     | 注文ID     |
| product_id | UUID     | 商品ID     |
| quantity   | Int      | 数量       |
| unit_price | Decimal  | 単価       |

#### レビューテーブル (reviews)

| カラム名   | データ型 | 説明       |
| ---------- | -------- | ---------- |
| id         | UUID     | レビューID |
| user_id    | UUID     | ユーザーID |
| product_id | UUID     | 商品ID     |
| rating     | Int      | 評価       |
| comment    | Text     | コメント   |
| created_at | DateTime | 作成日時   |
