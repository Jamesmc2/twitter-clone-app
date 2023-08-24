class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :profile_picture_url, presence: true
end
