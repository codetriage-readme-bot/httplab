class PostsController < ApplicationController
  def index
    top_users
    @top_message_rating = Post.all.order('message_rating DESC').limit(number)
  end

  private
  
  def top_users
    users = User.all
    @top_posts = users.order('posts_count DESC').limit(number)
    @top_average_rating = users.sort_by(&:middle_rating).reverse.take(number)
  end

  def number
    5
  end
end
