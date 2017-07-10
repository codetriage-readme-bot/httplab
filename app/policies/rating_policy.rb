class RatingPolicy < ApplicationPolicy

  def create?
    user
  end

  def permitted_attributes
    %i[post_id vote]
  end
end
