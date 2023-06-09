class OrgPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if @user.admin?

      scope.where(id: @user.org_id)
    end
  end

  def index?
   @user.admin?
  end

  def show?
   @user.admin?
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
