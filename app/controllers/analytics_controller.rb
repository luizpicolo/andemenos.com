class AnalyticsController < ApplicationController
  before_action :authenticate_user!

  def index
    @access_category = Analytic.joins(:product_category)
                               .where("local = ?", "category")
                               .group(:"product_categories.name")
                               .select(:product_category_id)
                               .order("count_product_category_id desc").count

   @access_subcategory = Analytic.joins(:product_subcategory)
                                 .where("local = ?", "subcategory")
                                 .group(:"product_subcategories.name")
                                 .select(:product_subcategory_id)
                                 .order("count_product_subcategory_id desc").count
    render layout: false
  end
end
