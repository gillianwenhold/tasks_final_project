# frozen_string_literal: true

class UserTasksController < AplicationController
  def create
    @user_task = UserTask.create(
      user_id: params[:user_id]
      task_id: params[:task_id]
    )
end
