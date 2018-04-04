class Event < ApplicationRecord
  belongs_to :program

  acts_as_url :name, url_attribute: 'slug'

  scope :in_the_future, -> { where('start_at >= ?', Time.current) }

  def to_param
    slug
  end
end
