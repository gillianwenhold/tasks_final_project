# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it "is valid with a username, first and last name, cohort, and password" do
      expect(build(:user)).to be_valid
    end

    it "is not valid without a password" do
      expect(build(:user, password: nil)).not_to be_valid
    end

    it "is valid with an admin boolean" do
      expect(build(:user, admin: true)).to be_valid
    end

    it "defaults to admin => false" do
      user = build(:user)
      expect(user.admin).to eq(false)
    end
  end

  describe "associations" do
    it "belongs to a cohort" do
      cohort = build(:cohort)
      user = build(:user, cohort: cohort)
      expect(user.cohort).to eq(cohort)
    end

    it "has many user_tasks, and tasks through user_tasks" do
      user = create(:user, username: "jack")
      first_task = create(:task, description: "Emails")
      second_task = create(:task, description: "Calls")

      join_1 = create(:user_task, user_id: user.id, task_id: first_task.id)
      join_2 = create(:user_task, user_id: user.id, task_id: second_task.id)

      expect(user.user_tasks.count).to eq(2)
      expect(user.user_tasks.last).to eq(join_2)
      expect(user.tasks.first).to eq(first_task)
      expect(user.tasks.last).to eq(second_task)
    end
  end
end
