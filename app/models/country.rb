# Model Country
class Country < ActiveRecord::Base
  validates :name, :iso, presence: true

  # Associations
  has_many :states, inverse_of: :country
end
