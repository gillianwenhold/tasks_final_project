# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  skip_before_action :require_login, only: %i[new create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @cohort = @user.cohort
    @tasks = @user.tasks.all.order(due_date: :asc)
    flash[:notice] = Task.pastdue(@tasks) if @user == current_user
  end

  def edit; end

  def update
    @user.update(user_params)
    if @user.save
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "User deleted."
    redirect_to root_path
  end

private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :username,
      :password,
      :password_confirmation,
      :first_name,
      :last_name,
      :grade,
      :cohort_id,
      :admin
    )
  end
end
