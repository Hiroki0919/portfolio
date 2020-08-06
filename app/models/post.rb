class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :post_tag_rels, dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_many :feels
  has_many :felt_users, through: :feels, source: :user
  has_many :tags, through: :post_tag_rels
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true
  validates :content, presence: true
end
