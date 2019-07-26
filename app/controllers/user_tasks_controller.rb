# frozen_string_literal: true

class UserTasksController < ApplicationController

  def new
    @user_task = UserTask.new
  end

  def create
    @user_task = UserTask.create(
      user_id: params[:user_id],
      task_id: params[:task_id]
    )
    redirect_to tasks_path
  end
end
