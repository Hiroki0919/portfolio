class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :post_tag_rels, dependent: :destroy
  has_many :tags, through: :post_tag_rels
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true
  validates :content, presence: true
end
