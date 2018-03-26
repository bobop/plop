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
        schools_path
      end
    end

  private
  
    def set_school
      if current_user.present? && !current_user.admin?
        @school = current_user.school
        raise Pundit::NotAuthorizedError if params[:school_id].present? && @school.slug != params[:school_id]
      end
      @school = School.find_by_slug(params[:school_id]) unless @school.present?
    end

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
end
