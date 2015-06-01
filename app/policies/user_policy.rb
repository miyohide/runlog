class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.except_admin
      end
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
    if user == record
      true
    else
      user.admin? or can? "update"
    end
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? or can? "destroy"
  end
end
