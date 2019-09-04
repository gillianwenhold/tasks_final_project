# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User Tasks", type: :model do
  it "is valid with a user and task" do
    user = create(:user, username: "jack")
    task = create(:task, description: "Emails")
    join = create(:user_task, user: user, task: task)
    expect(join).to be_valid
  end

  it "belongs to a user" do
    user = create(:user, username: "jack")
    task = create(:task, description: "Emails")
    join = create(:user_task, user: user, task: task)
    expect(join.user).to eq(user)
  end

  it "belongs to a task" do
    user = create(:user, username: "jack")
    task = create(:task, description: "Emails")
    join = create(:user_task, user: user, task: task)
    expect(join.task).to eq(task)
  end
end
