class MessagePolicy < ApplicationPolicy

  def create?
    return true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
