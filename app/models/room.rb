class Room < ApplicationRecord
  belongs_to :school
  has_many :children

  acts_as_url :name, url_attribute: 'slug'

  def to_param
    slug
  end
end
