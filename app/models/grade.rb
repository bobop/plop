class Grade < ApplicationRecord
  belongs_to :school

  acts_as_url :name, url_attribute: 'slug'

  def to_param
    slug
  end
end
