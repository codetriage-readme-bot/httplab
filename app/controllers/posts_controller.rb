class PostsController < ApplicationController
  def index
    top_users
    @top_posts_message_rating = Post.all.order('message_rating DESC').limit(MAGIC_NUMBER)
  end

  private

  def top_users
    users = User.all
    @top_users_posts = users.order('posts_count DESC').limit(MAGIC_NUMBER)
    @top_users_average_rating = users.sort_by(&:avarage_rating).reverse.take(MAGIC_NUMBER)
  end

  MAGIC_NUMBER = 5
end
