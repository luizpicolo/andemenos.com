module AnalyticHelper
  def analytics(offers, local = nil)
    if !black_list_ip.include? request.remote_ip
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

  def black_list_ip
    ['74.86.158.110', '66.249.65.131', '66.249.65.86', '66.249.73.239',
    '66.249.65.89', '69.58.178.56']
  end
end
