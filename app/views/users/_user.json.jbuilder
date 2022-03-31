json.extract! user, :id, :phone, :email, :name, :otp, :otp_created_at, :otp_confirmed_at, :status, :created_at, :updated_at
json.url user_url(user, format: :json)
