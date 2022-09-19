json.extract! account, :id, :first_name, :last_name, :email, :password_digest, :points, :admin, :created_at, :updated_at
json.url account_url(account, format: :json)
