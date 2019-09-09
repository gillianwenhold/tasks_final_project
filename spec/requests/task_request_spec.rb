# frozen_string_literal: true

require "rails_helper"
require "pry"

RSpec.describe "Task requests", :type => :request do
  before :each do
    Task.destroy_all
    Group.destroy_all
    User.destroy_all
    @group = create(:group)
    @user = create(:user, group: @group)
    @task = create(:task)
    allow_any_instance_of(ApplicationController).to receive(:require_login).and_return(@user.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    allow_any_instance_of(Task).to receive_messages(priority: 1, due_date: Time.now, description: "New Task", group: @group)
  end

  it "GETs the index page successfully" do
    get "/tasks"
    expect(response.status).to eq(200)
  end

  it "Creates a new task" do
    headers = { "ACCEPT" => "application/json" }
    post "/tasks", params: { :task => { priority: 1, due_date: Time.now, description: "New Task" } }, headers: headers
    expect(response).to redirect_to(assigns(:task))
  end

  it "Marks a task as complete" do
    allow(@task).to receive(:complete) { true }
    headers = { "ACCEPT" => "application/json" }
    post_url = "/tasks/" + @task.id.to_s
    patch post_url, params: { :task => { complete: true } }, headers: { "ACCEPT" => "application/json" }
    expect(@task.complete).to eq(true)
  end
end
