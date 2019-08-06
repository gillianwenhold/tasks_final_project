# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_login

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def user_admin
    return head(:forbidden) unless current_user.admin
  end

  helper_method :current_user
  helper_method :user_admin

private

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
