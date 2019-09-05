# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Tasks", type: :feature do
  describe "GET /tasks" do
    it "Gets all tasks" do
    end
  end

  describe "Marking a task complete" do
    it "updates a task to be marked as complete" do
      group = create(:group)
      task = create(:task, group: group)
      visit task_path(task)
      click_button "Mark Completed"
      expect(task.complete).to eq(true)
    end

    it "does not refresh the page" do
    end

    it "updates the due date div to reflect the change" do
    end
  end
end
