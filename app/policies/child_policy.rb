class ChildPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    @user.parent?
  end

  def show?
    @user.children.include?(@record)
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
