class AnalyticsController < ApplicationController
  before_action :authenticate_user!

  def index
    @access_category = Analytic.joins(:product_category)
                               .where("local = ?", "category")
                               .group(:"product_categories.name")
                               .select(:product_category_id)
                               .order("count_product_category_id desc").count
    render layout: false
  end
end
