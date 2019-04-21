class User < ApplicationRecord
  has_secure_token :token
  validates :user_id, :password, presence: true
end
