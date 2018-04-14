class ProductCategory < ApplicationRecord
  belongs_to :school

  acts_as_url :name, url_attribute: 'slug'

  def to_param
    slug
  end

  def to_s
    name
  end
end
