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
      user.admin? || can?("index")
    end
  end

  def show?
    user.admin? || can?("show")
  end

  def create?
    user.admin? || can?("create")
  end

  def new?
    create?
  end

  def update?
    user == record || user.admin? || can?("update")
  end

  def edit?
    update?
  end

  def destroy?
    user.admin? || can?("destroy")
  end
end
