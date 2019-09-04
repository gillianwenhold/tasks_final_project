# frozen_string_literal: true

require "rails_helper"

RSpec.describe Group, type: :model do
  it "is valid with a name and description" do
    expect(build(:group)).to be_valid
  end

  it "has many tasks" do
    group = create(:group)
    first_task = create(:task, description: "first task", group: group)
    second_task = create(:task, description: "second task", group: group)
    expect(group.tasks.count).to eq(2)
  end

  it "has many users" do
    group = create(:group)
    first_task = create(:user, username: "Alex", group: group)
    second_task = create(:user, username: "Bob", group: group)
    expect(group.users.count).to eq(2)
  end
end
