# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  it "is valid with a username, first and last name, cohort, and password" do
    expect(build(:user)).to be_valid
  end

  it "defaults to admin => false" do
    user = build(:user)
    expect(user.admin).to eq(false)
  end

  it "is not valid without a password" do
    expect(build(:user, password: nil)).not_to be_valid
  end

  it "is valid with an admin boolean" do
    expect(build(:user, admin: true)).to be_valid
  end

  it "belongs to a cohort" do
    cohort = build(:cohort)
    user = build(:user, cohort: cohort)
    expect(user.cohort).to eq(cohort)
  end

  it "has many user_tasks, and tasks through user_tasks" do
    first_user = create(:user, username: "jack")
    second_user = create(:user, username: "gill")
    first_task = create(:task, description: "Emails")
    second_task = create(:task, description: "Calls")

    join_1 = build("First UT", user_id: first_user.id, task_id: first_task.id)
    join_2 = build("Second UT", user_id: second_user.id, task_id: second_task.id)

    expect(first_user.user_tasks.first).to eq(first_user_task)
    expect(user.user_tasks.last).to eq(second_user_task)
    expect(user.tasks.first).to eq(emails)
    expect(user.tasks.last).to eq(calls)
  end
end
