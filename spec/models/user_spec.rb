require "rails_helper"

RSpec.describe User, type: :model do
  let(:cohort) {
    Cohort.create(
      name: "Education & Youth Justice",
      description: "The Education & Youth Justice Cohort"
    )
  }

  let(:user) {
    User.create(
      username: "gillian",
      password: "pass",
      first_name: "Gillian",
      last_name: "Wenhold",
      grade: 17,
      cohort_id: cohort.id,
      admin: false
    )
  }

  let(:admin_user) {
    User.create(
      username: "admin",
      password: "password",
      first_name: "Admin",
      last_name: "User",
      cohort_id: cohort.id,
      admin: true
    )
  }

  let(:emails) {
    Task.create(
      priority: 1,
      due_date: Time.now,
      description: "Email this person: ",
      complete: false,
      cohort_id: cohort.id
    )
  }

  let(:calls) {
    Task.create(
      priority: 2,
      due_date: Time.now,
      description: "Call this person: ",
      complete: false,
      cohort_id: cohort.id
    )
  }

  it "is valid with a username, first and last name, cohort, and password" do
    expect(user).to be_valid
  end

  it "is not valid without a password" do
    expect(User.new(username: "Gillian")).not_to be_valid
  end

  it "is valid with an admin boolean" do
    expect(admin_user).to be_valid
  end

  it "defaults to admin => false" do
    expect(user.admin).to eq(false)
  end

  it "belongs to a cohort" do
    expect(user.cohort).to eq(cohort)
  end

  it "has many user_tasks, and tasks through user_tasks" do
    first_user_task = UserTask.create(user_id: user.id, task_id: emails.id)
    second_user_task = UserTask.create(user_id: user.id, task_id: calls.id)
    expect(user.user_tasks.first).to eq(first_user_task)
    expect(user.user_tasks.last).to eq(second_user_task)
    expect(user.tasks.first).to eq(emails)
    expect(user.tasks.last).to eq(calls)
  end
end
