class RatingPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end

  def create?
    user
  end

  def permitted_attributes
    [:user_id, :post_id, :vote]
  end
end
