class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :school, optional: true
  has_many :children

  def parent?
    role == 'parent'
  end

  def coordinator?
    role == 'coordinator'
  end

  def admin?
    role == 'admin'
  end
end
