# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :user_admin
  before_action :set_group, only: %i[show edit update destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      redirect_to group_path(@group)
    else
      redirect_to new_group_path
    end
  end

  def edit; end

  def update
    @group.update(group_params)
    if @group.save
      flash[:notice] = "Group Updated."
      redirect_to @group
    else
      flash[:notice] = "Error. Please try again."
    end
  end

  def show
    @members = @group.users.all
    @tasks = @group.tasks.all.order(due_date: :asc)
    format_response(:show, @group)
    flash[:notice] = Task.pastdue(@tasks)
  end

  def destroy
    @group.destroy
    flash[:notice] = "Group deleted."
    redirect_to groups_path
  end

private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group)
          .permit(:name, :description)
  end

  def format_response(view, object)
    respond_to do |format|
      format.html { render view }
      format.json do
        render json: object.to_json(
          only: %i[id name description],
          include: [users: { only: %i[id first_name last_name] }]
        )
      end
    end
  end
end
