class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },format: { with: VALID_EMAIL_REGEX },
  uniqueness: {case_sensitive: true}
  validates :gender, presence: true
  validates :age, presence: true, numericality: {only_integer: true}
  validates :job, presence: true
  validates :area, presence: true
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true
end
