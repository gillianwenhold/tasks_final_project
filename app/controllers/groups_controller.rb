# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :user_admin
  before_action :set_group, only: %i[show destroy]

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

  def show
    @members = @group.users.all
    @tasks = @group.tasks.all.order(due_date: :asc)
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
end
