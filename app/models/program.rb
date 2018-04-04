class Program < ApplicationRecord
  belongs_to :school
  has_many :events

  acts_as_url :name, url_attribute: 'slug'

  def to_param
    slug
  end
end
