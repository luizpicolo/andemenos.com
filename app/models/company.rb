# Model Company
class Company < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  mount_uploader :logo, CompanyUploader
  validates :name, :address, :city, :logo, presence: true

  # Association
  belongs_to :city, inverse_of: :companies
  belongs_to :line_of_business, inverse_of: :companies
  has_many :offers, inverse_of: :company, dependent: :destroy
  has_many :analytics, inverse_of: :company, dependent: :destroy
end
