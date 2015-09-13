# Model Line of Business
class LineOfBusiness < ActiveRecord::Base
  validates :name, presence: true

  # Associations
  has_many :companies, inverse_of: :line_of_business

  def slug
    name.downcase
  end
end
