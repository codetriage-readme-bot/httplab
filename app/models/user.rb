class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :ratings

  alias_method :authenticate, :valid_password?

  def api_token
    Knock::AuthToken.new(payload: { sub: id }).token
  end

  def middle_rating
    posts.group(:id).sum(:message_rating).sum { |_key, value| value } / posts_count
  rescue ZeroDivisionError
    puts 'User has no posts'
    0
  end
end
