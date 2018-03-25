class GradePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.admin?
        scope
      else
        scope.where(school_id: @user.school_id)
      end
    end
  end

  def index?
    @user.admin? || @user.coordinator?
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    @user.admin? || @user.coordinator?
  end

  def new?
    create?
  end

  def update?
    @user.admin? || @user.coordinator?
  end

  def edit?
    update?
  end

  def destroy?
    @user.admin? || @user.coordinator?
  end
end
