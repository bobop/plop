class School < ApplicationRecord
  has_many :divisions
  has_many :grades
  has_many :rooms
  has_many :children
  has_many :programs
  has_many :events, through: :programs

  acts_as_url :name, url_attribute: 'slug'

  def to_param
    slug
  end
end
