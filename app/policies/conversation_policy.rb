class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end
end
