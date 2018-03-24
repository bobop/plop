class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  
    def set_school
      @school = School.find_by_slug(params[:school_id])
    end
end
