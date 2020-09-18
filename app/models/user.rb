class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true, presence: true, length: {minimum: 3, maximum: 15}
  has_many :messages
end
