# frozen_string_literal: true

class StaticController < ApplicationController
  def home
    redirect_to user_path(session[:user_id]) if session[:user_id]
  end
end
