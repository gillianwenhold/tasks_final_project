# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Please check your username/password, and try again."
      redirect_to login_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
