class SchoolPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    @user.present? && @user.admin?
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    @user.present? && @user.admin?
  end

  def new?
    create?
  end

  def update?
    @user.present? && @user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    @user.present? && @user.admin?
  end
end
