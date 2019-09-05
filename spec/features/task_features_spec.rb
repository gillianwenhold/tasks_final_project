# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Tasks", type: :feature do

  before do
    Task.destroy_all
    Group.destroy_all
    User.destroy_all
    @group = Group.create!(name: "Group", description: "Test group")
    @user = User.create!(username: "user", password: "pass", first_name: "user", last_name: "one", group: @group)
    @task = Task.create!(priority: 1, due_date: Time.now, description: "First task", complete: false, group: @group)
    @task2 = Task.create!(priority: 1, due_date: Time.now, description: "Second task", complete: false, group: @group)
    visit login_path
    fill_in "Username", with: @user.username
    fill_in "Password", with: @user.password
    click_button "login"
  end

  describe "task show page" do
    it "shows the task" do
      visit task_path(@task)
      expect(page).to have_content(@task.description)
    end
  end
=begin
  describe "Marking a task complete" do
    before do
      User.destroy_all
      Group.destroy_all
      Task.destroy_all
      @user = create(:user)
      @group = create(:group)
      @task = create(:task, group: @group)
    end

    it "updates a task to be marked as complete" do
      visit task_path(@task)
      expect(page).to have_content("Mark Completed")
    end

    it "does not refresh the page" do
    end

    it "updates the due date div to reflect the change" do
    end
  end
=end
end
