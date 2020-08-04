class Tag < ApplicationRecord
  has_many :post_tag_rels, dependent: :destroy
  has_many :posts, through: :post_tag_rels

  validates :name, presence: true
end
