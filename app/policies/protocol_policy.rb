class ProtocolPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all if @user.admin?

      scope.where(org_id: @user.org_id)
    end
  end

  def index?
    same_org?
  end

  def show?
    same_org?
  end

  def create?
    same_org?
  end

  def update?
    same_org?
  end

  def destroy?
    same_org?
  end

  private

  def same_org?
    @record.org_id == @user.org_id
  end
end
