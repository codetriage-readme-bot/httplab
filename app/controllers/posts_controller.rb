class PostsController < ApplicationController
  def index
    users = User.all
    @top_posts_users = users.order('posts_count DESC').limit(5)
    @top_rating_users = users.order('vote_rating DESC').limit(5)
    @top_average_rating_users = users.order('vote_rating DESC').limit(5)
  end
end
