# terraform

- Initialize(初回のみ)

```bash
# state保持用のS3 bucket作成
export BUCKET_NAME=<バケット名>
aws s3 mb s3://${BUCKET_NAME}

# state lock用のテーブル作成
aws dynamodb create-table --table-name terraform-state-lock --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --billing-mode PAY_PER_REQUEST
```

- prepare

```bash
export AWS_PROFILE=<your profile>
```

- deploy

```bash
tarraform init
terraform plan
terraform apply
```

- other commands

```bash
# バリデーション
terraform validate

# コードのフォーマット
terraform fmt --recursive

# 強制ロック解除
terraform force-unlock <ID>
```
