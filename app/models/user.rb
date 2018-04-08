class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  belongs_to :school, optional: true
  has_many :children

  validates           :email, uniqueness: { scope: :school_id }, allow_blank: true
  validates_format_of :email, with: Devise.email_regexp, allow_blank: true, if: :will_save_change_to_email?

  validates_presence_of     :password, if: :password_required?
  validates_confirmation_of :password, if: :password_required?
  validates_length_of       :password, within: Devise.password_length, allow_blank: true

  def parent?
    role == 'parent'
  end

  def coordinator?
    role == 'coordinator'
  end

  def admin?
    role == 'admin'
  end

  protected

    def self.find_for_database_authentication(conditions)
      puts "--- User find_for_authentication"
      # find_for_authentication(conditions)
      school_id = conditions.delete(:school_id)
      where(conditions).where(school_id: school_id).first
    end

    def password_required?
      !persisted? || !password.nil? || !password_confirmation.nil?
    end
end
