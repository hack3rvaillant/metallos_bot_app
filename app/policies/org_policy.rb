class OrgPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if @user.admin?

      scope.where(id: @user.org_id)

      scope.all
    end
  end

  def index?
   true # @user.admin?
  end

  def show?
   true # @user.admin?
  end

  def create?
   true # @user.admin?
  end

  def update?
   true # @user.admin?
  end

  def destroy?
   true # @user.admin?
  end
end
