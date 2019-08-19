class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :country_of_origin, presence: true
  validates :cost, presence: true


  before_save(:titleize_product)

  scope :america, -> { where(country_of_origin: "America")}
  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}

  scope :most_reviews, -> {(
  select("products.id, products.name, products.cost, count(reviews.id) as reviews_count")  
    )}

  private
    def titleize_product
      self.name = self.name.titleize
    end
end
