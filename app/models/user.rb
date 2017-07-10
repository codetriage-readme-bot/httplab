class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :ratings
  after_initialize :init

  def init
    self.vote_rating  ||= 0
    self.posts_count ||= 0
  end

  # https://davidcel.is/posts/stop-validating-email-addresses-with-regex/
  validates_format_of :email, with: /.*@.*/
  validates_presence_of :password, if: :password_required?
  validate :password_match?, if: :password_required?
  alias_method :authenticate, :valid_password?

  def password_match?
    self.errors[:password] << 'cannot be blank' if password.blank?
    self.errors[:password_confirmation] << 'cannot be blank' if password_confirmation.blank?
    self.errors[:password_confirmation] << 'does not match' if password != password_confirmation
    password.present? && password == password_confirmation
  end

  def password_required?
    # Password is required if it is being set, but not for new records
    if persisted?
      !password.nil? || !password_confirmation.nil?
    else
      true
    end
  end

  def api_token
    Knock::AuthToken.new(payload: { sub: id }).token
  end

  def middle_rating
    begin
      posts.group(:id).sum(:message_rating).sum { |_key, value| value } / posts_count
    rescue ZeroDivisionError
      puts 'User has no posts'
      0
    end
  end
end
