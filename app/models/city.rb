# Model City
class City < ActiveRecord::Base
  validates :name, presence: true

  # Associations
  belongs_to :state, inverse_of: :cities
  has_many :companies, inverse_of: :city
  has_many :analytics, inverse_of: :city
end
