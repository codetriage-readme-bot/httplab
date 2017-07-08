class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :ratings
  # https://davidcel.is/posts/stop-validating-email-addresses-with-regex/
  validates_format_of :email, with: /.*@.*/
  validates_presence_of :password
  validate :password_match?
  alias_method :authenticate, :valid_password?

  def password_match?
    self.errors[:password] << 'cannot be blank' if password.blank?
    self.errors[:password_confirmation] << 'cannot be blank' if password_confirmation.blank?
    self.errors[:password_confirmation] << 'does not match' if password != password_confirmation
    password.present? && password == password_confirmation
  end

  def api_token
    Knock::AuthToken.new(payload: { sub: id }).token
  end
end
