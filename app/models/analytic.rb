# Class
class Analytic < ActiveRecord::Base
  belongs_to :product, inverse_of: :analytics
  belongs_to :product_category, inverse_of: :analytics
  belongs_to :product_subcategory, inverse_of: :analytics
  belongs_to :offer, inverse_of: :analytics
  belongs_to :city, inverse_of: :analytics
  belongs_to :company, inverse_of: :analytics
end
