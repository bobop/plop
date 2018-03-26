class ChildPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    @user.present?
  end

  def show?
    @user.admin? || @user.children.include?(@record)
  end

  def create?
    @user.parent?
  end

  def new?
    create?
  end

  def update?
    @user.children.include?(@record)
  end

  def edit?
    update?
  end

  def destroy?
    @user.children.include?(@record)
  end
end
