# frozen_string_literal: true

class CohortsController < ApplicationController
  def index
    @cohorts = Cohort.all
  end

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.create(cohort_params)
    if @cohort.save
      redirect_to cohort_path(@cohort)
    else
      redirect_to new_cohort_path
    end
  end

  def show
    @cohort = Cohort.find(params[:id])
    @members = @cohort.users.all
    @tasks = @cohort.tasks.all.order(due_date: :asc)
    flash[:notice] = Task.pastdue(@tasks)
  end

private

  def cohort_params
    params.require(:cohort).permit(:name, :description)
  end
end
