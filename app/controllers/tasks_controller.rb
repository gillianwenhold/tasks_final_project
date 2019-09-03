# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks =
      if params[:group_id]
        Group.find(params[:group_id]).tasks.order(due_date: :asc)
      else
        Task.all.order(due_date: :asc)
      end
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @tasks.to_json(only: [:id, :priority, :due_date, :description, :complete], include: [group: {only: [:name]}, users: {only: [:username]}]) }
    end
    flash[:notice] = Task.pastdue(@tasks)
  end

  def new
    @task = Task.new
    @task.group_id = params[:id] if params[:id]
  end

  def create
    @task = Task.create(task_params)
    if @task.save
      flash[:notice] = "Task successfully created."
      redirect_to @task
    else
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @task.to_json(only: [:id, :priority, :due_date, :description, :complete], include: [group: {only: [:name]}, users: {only: [:username]}]) }
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    if @task.save
      flash[:notice] = "Task Updated."
      redirect_to @task
    else
      flash[:notice] = "Error. Please try again."
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Task deleted."
    redirect_to tasks_path
  end

private

  def task_params
    params.require(:task).permit(
      :priority, :description, :complete, :due_date, :group_id
    )
  end
end
