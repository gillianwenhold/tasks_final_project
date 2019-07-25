# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    return redirect_to root_path unless @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show; end

  def update; end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :username,
      :password,
      :first_name,
      :last_name,
      :grade,
      :cohort_id
    )
  end
end
