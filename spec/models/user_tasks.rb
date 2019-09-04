# frozen_string_literal: true

require "rails_helper"

RSpec.describe User_Tasks, type: :model do
  before :each do
    group = create(:group)
    user = create(:user)
    user_task = build(:user_task, user: user, group: group)
  end

  it "is valid with a user and task" do
    expect(user_task).to be_valid
  end

  it "belongs to a user" do
    expect(user_task.user).to eq(user)
  end

  it "belongs to a task" do
    expect(user_task.task).to eq(task)
  end
end
