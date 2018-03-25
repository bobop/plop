class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # after_action :verify_authorized

  protected
    def after_sign_in_path_for(resource)
      case resource.role
      when 'parent', 'coordinator'
        school_path(resource.school)
      when 'admin'
        root_path
      end
    end

  private
  
    def set_school
      @school = School.find_by_slug(params[:school_id])
      @school = current_user.school if @school.blank? && current_user.present?
    end

    def user_not_authorized
      # raise ActiveRecord::RecordNotFound
      render file: "#{Rails.root}/public/404.html", status: 404
    end
end
