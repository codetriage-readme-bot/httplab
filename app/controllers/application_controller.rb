class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit
  def root
    skip_authorization
    skip_policy_scope
  end
end
