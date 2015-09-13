class SearchController < ApplicationController
  def index
    conditional = {}
    # conditional[:status] = true
    conditional[:end_date_offer] = {
      gte: Time.zone.now.strftime("%Y-%m-%d").to_date
    }
    @offers = Offer.search(params[:search], where: conditional, suggest: true)

    if @offers.present?
      @sugetions = @offers.suggestions
    else
      @msg = true
      @offers = Offer.random_list
    end
  end
end
