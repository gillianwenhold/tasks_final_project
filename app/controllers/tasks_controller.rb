# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = if params[:cohort_id]
               Cohort.find(params[:cohort_id]).tasks.order(due_date: :asc)
             else
               Task.all.order(due_date: :asc)
             end
    flash[:notice] = "Overdue tasks!" if @tasks.overdue.any?
  end

  def new
    @task = Task.new
    @task.cohort_id = params[:id] if params[:id]
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

private

  def task_params
    params.require(:task).permit(
      :priority, :description, :complete, :due_date, :cohort_id
    )
  end

  def check
    "There are overdue task(s). Please check the list!"
  end
end
