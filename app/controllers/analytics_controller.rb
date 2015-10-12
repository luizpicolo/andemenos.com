class AnalyticsController < ApplicationController
  before_action :authenticate_user!

  def index
    @access_category = Analytic.joins(:product_category)
                               .where(:created_at => (params[:dateinit].to_date)..(params[:datefini].to_date))
                               .where("local = ?", "category")
                               .group(:"product_categories.name")
                               .select(:product_category_id)
                               .order("count_product_category_id desc").count

   @access_subcategory = Analytic.joins(:product_subcategory)
                                 .where(:created_at => (params[:dateinit].to_date)..(params[:datefini].to_date))
                                 .where("local = ?", "subcategory")
                                 .group(:"product_subcategories.name")
                                 .select(:product_subcategory_id)
                                 .order("count_product_subcategory_id desc").limit(10).count

   @access_product = Analytic.joins(:product)
                             .where(:created_at => (params[:dateinit].to_date)..(params[:datefini].to_date))
                             .where("local = ?", "product")
                             .group(:"products.name")
                             .select(:product_id)
                             .order("count_product_id desc").limit(10).count

   @pages = Analytic.joins(:company)
                    .where(:created_at => (params[:dateinit].to_date)..(params[:datefini].to_date))
                    .where("local != ?", "home").where("local != ?", "product").where("local != ?", "subcategory").where("local != ?", "category")
                    .group(:"companies.slug")
                    .select(:company_id)
                    .order("count_company_id desc").count

    render layout: false
  end
end
