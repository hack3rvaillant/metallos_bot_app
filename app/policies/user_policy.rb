class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if @user.admin?

      scope.where(org_id: @user.org_id)
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    @user.admin?
  end

  def update?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end
end
