class Account < ApplicationRecord
    has_secure_password
    validates :first_name, :last_name, :email, :password, presence: true
end


