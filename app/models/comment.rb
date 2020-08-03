class Comment < ApplicationRecord
  belongs_to :post
  default_scope -> { order(created_at: :desc) }
  validates :comment, presence: true
end
