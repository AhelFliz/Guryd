class ApplicationController < ActionController::Base
  include Pundit

  before_action :authenticate_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  attr_reader :current_user

  helper_method :current_user

  def authenticate_user
    return unless session[:user_id]

    @current_user = User.find(session[:user_id])
  end

  def user_not_authorized
    render plain: "403 - Not authorized", code: 403
  end
end
