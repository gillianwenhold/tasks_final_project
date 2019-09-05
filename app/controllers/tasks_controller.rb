# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks =
      if params[:group_id]
        Group.find(params[:group_id]).tasks.order(due_date: :asc)
      else
        Task.all.order(due_date: :asc)
      end
    format_response(:index, @tasks)
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
    format_response(:show, @task)
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

  def format_response(view, object)
    respond_to do |format|
      format.html { render view }
      format.json do
        render json: object.to_json(
          only: %i[id priority due_date description complete],
          include: [group: { only: %i[name] },
                    users: { only: %i[username] }]
        )
      end
    end
  end
end
