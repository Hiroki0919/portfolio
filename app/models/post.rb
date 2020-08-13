class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :post_tag_rels, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user, dependent: :destroy
  has_many :feels, dependent: :destroy
  has_many :felt_users, through: :feels, source: :user, dependent: :destroy
  has_many :tags, through: :post_tag_rels
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true, length: { maximum: 50}
  validates :content, presence: true
end
