class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates_length_of :name, maximum: 100
  before_save(:titleize_product)
  scope :india, -> { where(country_of_origin: "India")}

  private
    def titleize_product
      self.name = self.name.titleize
    end
end
