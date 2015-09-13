module AnalyticHelper
  def analytics(offers, local = nil)
    offers.each do |offer|
      Analytic.create({
        ip: request.remote_ip,
        product: offer.product,
        product_category: offer.category,
        product_subcategory: offer.subcategory,
        offer: offer,
        local: local,
        company: offer.company
      })
    end
  end
end
