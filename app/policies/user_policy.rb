class UserPolicy < ApplicationPolicy
  def permitted_attributes
    [:posts_count, :vote_rating]
  end
end
