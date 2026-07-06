class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  enum :role, { admin:0, trainer: 1 }
  has_one :trainer
end
