class User < ApplicationRecord
  has_many :posts , dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :feels, dependent: :destroy
  has_many :felt_posts, through: :feels, source: :post
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
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
  def already_felt?(post)
    self.feels.exists?(post_id: post.id)
  end
end
