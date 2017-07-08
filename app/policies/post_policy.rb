class PostPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  def show?
    user
  end

  alias_method :index?, :show?
  alias_method :create?, :show?

  def permitted_attributes
    [:user_id, :message]
  end
end
