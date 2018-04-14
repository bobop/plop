class Product < ApplicationRecord
  belongs_to :school
  belongs_to :supplier, optional: true
  belongs_to :product_category, optional: true

  acts_as_url :name, url_attribute: 'slug'

  def to_param
    slug
  end
end
