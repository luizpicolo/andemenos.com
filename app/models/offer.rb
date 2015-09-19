# Class model offer
class Offer < ActiveRecord::Base
  searchkick suggest: ['product_name']

  # Validations
  validates :product, :company, :offer_price, :start_date_offer,
            :end_date_offer, presence: true
  validate :check_price
  validate :check_interval_between_dates

  # Associations
  belongs_to :product, inverse_of: :offers
  belongs_to :company, inverse_of: :offers
  has_many :analytics, inverse_of: :offer, dependent: :destroy

  # Search Kick
  def search_data
    attributes.merge(
      product_name: product.name,
      category_name: category.name,
      subcategory_name: subcategory.name,
      company_name: company.name
    )
  end

  def rating_product
    Product.find(product)
  end

  def start_date
    start_date_offer.day
  end

  def end_date
    end_date_offer.day
  end

  def month
    I18n.t('date.month_names')[end_date_offer.month]
  end

  def category
    product.product_subcategory.product_category
  end

  def subcategory
    product.product_subcategory
  end

  # Breadcrumb
  def bc_category
    category.slug
  end

  def bc_subcategory
    subcategory.slug
  end

  def bc_product_name
    product.slug
  end

  def check_price
    errors.add(
      :base, 'O preço em oferta não pode ser maior que o preço regular'
    ) if regular_price? && offer_price >= regular_price
  end

  def check_interval_between_dates
    if start_date_offer.present? && end_date_offer.present?
      errors.add(
        :base, 'A data inicial não pode ser maior que a data final'
      ) if start_date_offer > end_date_offer
    end
  end

  # Return array of offers
  def self.random_list
    find_by_sql(['select DISTINCT ON (product_id) *, o.id as id from offers as o
                 inner join products as p on (p.id = o.product_id)
                 inner join product_subcategories as ps on (ps.id = p.product_subcategory_id)
                 inner join product_categories as pc on (pc.id = ps.product_category_id)
                 where o.end_date_offer >= ? order by o.start_date_offer desc', Time.zone.now.strftime("%Y-%m-%d").to_date])
  end

  def self.list_by_category(category)
    find_by_sql(['select DISTINCT ON (product_id) *, o.id as id from offers as o
                 inner join products as p on (p.id = o.product_id)
                 inner join product_subcategories as ps on (ps.id = p.product_subcategory_id)
                 inner join product_categories as pc on (pc.id = ps.product_category_id)
                 where o.end_date_offer >= ? and pc.slug = ?', Time.zone.now.strftime("%Y-%m-%d").to_date, category])
  end

  def self.list_by_subcategory(subcategory)
    find_by_sql(['select DISTINCT ON (product_id) *, o.id as id from offers as o
                 inner join products as p on (p.id = o.product_id)
                 inner join product_subcategories as ps on (ps.id = p.product_subcategory_id)
                 inner join product_categories as pc on (pc.id = ps.product_category_id)
                 where o.end_date_offer >= ? and ps.slug = ?', Time.zone.now.strftime("%Y-%m-%d").to_date, subcategory])
  end

  def self.list_by_company(company)
    includes(:company, :product)
      .where(companies: { slug: company })
      .where('end_date_offer >= ?', Time.zone.now.strftime("%Y-%m-%d").to_date)
      .order('products.order_of_importance desc, products.name asc, offers.offer_price asc')
  end

  def self.list_by_name(name)
    includes(product: :product_subcategory)
      .where(products: { slug: name })
      .where('end_date_offer >= ?', Time.zone.now.strftime("%Y-%m-%d").to_date)
      .order('offers.offer_price asc')
  end

  def min_price
    price = Offer.where('product_id = ? ', product_id)
                 .where('end_date_offer >= ?', Time.zone.now.strftime("%Y-%m-%d").to_date)
                 .order('offer_price asc').limit(1).first
    price.offer_price
  end

  def time_now
    Time.zone.now.strftime("%Y-%m-%d").to_date
  end

  def companies
    Offer.distinct(:company_id)
         .where('product_id = ? ', product_id)
         .where('end_date_offer >= ?', Time.zone.now.strftime("%Y-%m-%d").to_date).count
  end
end
