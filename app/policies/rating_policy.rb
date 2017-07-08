class RatingPolicy < ApplicationPolicy

  def create?
    user
  end

  def permitted_attributes
    [:user_id, :post_id, :vote]
  end
end
