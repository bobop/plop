class School < ApplicationRecord
  has_many :divisions
  has_many :grades
  has_many :rooms

  acts_as_url :name, url_attribute: 'slug'

  def to_param
    slug
  end
end
