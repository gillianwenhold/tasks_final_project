# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :user_admin

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
    @group = Group.find(params[:id])
    @members = @group.users.all
    @tasks = @group.tasks.all.order(due_date: :asc)
    flash[:notice] = Task.pastdue(@tasks)
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:notice] = "Group deleted."
    redirect_to groups_path
  end

private

  def group_params
    params.require(:group).permit(:name, :description)
  end
end
