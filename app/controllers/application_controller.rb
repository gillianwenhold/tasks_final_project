# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_login

  def current_user
    User.find(session[:user_id])
  end

private

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
