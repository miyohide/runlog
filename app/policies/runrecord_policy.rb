class RunrecordPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.where(user_id: user.id).order(runned_at: :desc)
    end
  end

  def index?
    recordowner_is_own?
  end

  def show?
    recordowner_is_own?
  end

  def create?
    recordowner_is_own?
  end

  def new?
    create?
  end

  def update?
    recordowner_is_own?
  end

  def edit?
    update?
  end

  def destroy?
    recordowner_is_own?
  end

  private

  def recordowner_is_own?
    user.id == record.user_id
  end
end
