class Sweeper < ActionController::Caching::Sweeper
  observe Offer, Company, Product

  def after_save(record)
    ActionController::Base.new.expire_fragment('nav_categories')
  end

  def after_update(record)
    ActionController::Base.new.expire_fragment('nav_categories')
  end

  def after_destroy(record)
    ActionController::Base.new.expire_fragment('nav_categories')
  end
end
