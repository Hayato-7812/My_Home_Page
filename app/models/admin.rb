class Admin < ApplicationRecord
  validates :name, :password_digest, presence: true
  has_secure_password
end
