class Child < ApplicationRecord
  belongs_to :user
  belongs_to :school
  belongs_to :division, optional: true
  belongs_to :grade, optional: true
  belongs_to :room, optional: true
end
