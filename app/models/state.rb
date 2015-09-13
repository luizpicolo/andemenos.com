# Model state
class State < ActiveRecord::Base
  validates :name, :iso, :country, presence: true

  # Associations
  has_many :cities, inverse_of: :state
  belongs_to :country, inverse_of: :states
end
