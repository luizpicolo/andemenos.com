# Class Home
class HomeController < ApplicationController
  add_breadcrumb 'Início', :root_path
  include AnalyticHelper

  def index
    # session[:offers] = Offer.random_list if session[:offers].nil?
    @offers ||= Kaminari.paginate_array(Offer.random_list).page(params[:page])

    # Save data analytics
    analytics(@offers, 'home')
  end
end
