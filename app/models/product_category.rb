# Class category product
class ProductCategory < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Validations
  validates :name, presence: true

  # Association
  has_many :product_subcategories, inverse_of: :product_category
  has_many :analytics, inverse_of: :product_category

  def list_subcategories
    product_subcategories.joins(products: :offers)
      .select(
        'count(products.product_subcategory_id) as amount_ps',
        'product_subcategories.*')
      .where('offers.end_date_offer >= ?', Time.zone.now)
      .group('products.product_subcategory_id, product_subcategories.id')
      .order('product_subcategories.name asc')
  end
end
