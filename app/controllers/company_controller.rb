class CompanyController < ApplicationController
  include AnalyticHelper

  def index
    @company = Company.find_by_slug(params[:slug])
    @offers = Offer.list_by_company(params[:slug]).page(params[:page])

    analytics(@offers, @company.slug)
  end
end
