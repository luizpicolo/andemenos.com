# Class Product
class ProductsController < ApplicationController
  add_breadcrumb 'Início', :root_path
  include AnalyticHelper

  def list_by_category
    @offers = Offer.list_by_category(params[:category])

    analytics(@offers, 'category')

    add_breadcrumb @offers.first.category.name.downcase
  end

  def list_by_subcategory
    @offers = Offer.list_by_subcategory(params[:subcategory])

    analytics(@offers, 'subcategory')

    add_breadcrumb @offers.first.category.name.downcase, list_products_by_category_path(@offers.first.bc_category)
    add_breadcrumb @offers.first.subcategory.name.downcase
  end

  def list_by_name
    @offers = Offer.list_by_name(params[:slug])

    analytics(@offers, 'product')

    add_breadcrumb @offers.first.category.name.downcase, list_products_by_category_path(@offers.first.bc_category)
    add_breadcrumb @offers.first.subcategory.name.downcase, list_products_by_subcategory_path(@offers.first.bc_category, @offers.first.bc_subcategory)
    add_breadcrumb @offers.first.product.name.downcase
  end
end
