# Model product
class Product < ActiveRecord::Base
  letsrate_rateable "quality"

  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :image, ProductUploader
  validates :name, :product_subcategory, :image, presence: true

  # Associations
  belongs_to :product_subcategory, inverse_of: :products
  has_many :offers, inverse_of: :product
  has_many :analytics, inverse_of: :product

  def amount_users_avaliations
    Rate.where(rateable_type: "Product", rateable_id: id).count
  end
end
