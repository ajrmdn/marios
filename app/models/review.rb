class Review < ApplicationRecord
  belongs_to :product

  validates :author, presence: true
  validates :content_body, presence: true, length: { in: 1..250 }
  validates :rating, presence: true, length: { in: 1..5 }
end
