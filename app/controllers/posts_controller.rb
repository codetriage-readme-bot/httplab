class PostsController < ApplicationController
  def index
    users = User.all
    @top_posts = users.order('posts_count DESC').limit(number)
    @top_rating = users.order('vote_rating DESC').limit(number)
    @top_middle_rating = users.sort_by(&:middle_rating).reverse.take(number)
  end

  def number
    3
  end
end
