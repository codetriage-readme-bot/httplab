class RatingPolicy < ApplicationPolicy

  def create?
    user
  end

  def permitted_attributes
    [:post_id, :vote]
  end
end
