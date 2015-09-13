# Class medel subcategory
class ProductSubcategory < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Validations
  validates :name, presence: true

  # Association
  belongs_to :product_category, inverse_of: :product_subcategories
  has_many :products, inverse_of: :product_subcategory
  has_many :analytics, inverse_of: :product_subcategory
end
