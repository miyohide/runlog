class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    if user.nil?
      false
    else
      user.admin? or can? "index"
    end
  end

  def show?
    user.admin? or can? "show"
  end

  def create?
    if user.nil?
      false
    else
      user.admin? or can? "create"
    end
  end

  def new?
    create?
  end

  def update?
    user.admin? or can? "update"
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? or can? "destroy"
  end
end
