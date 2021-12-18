class User < ApplicationRecord
  validates :username, presence: true
  validates :username, uniqueness: true

  has_secure_password

  enum role: { author: 1, admin: 10 }

  has_many :posts
end
