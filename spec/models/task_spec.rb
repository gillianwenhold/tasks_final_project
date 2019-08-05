# frozen_string_literal: true

require "rails_helper"

RSpec.describe Task, type: :model do
  it "is valid with a due date, description, and cohort" do
    expect(build(:task)).to be_valid
  end

  it "belongs to a cohort" do
    cohort = build(:cohort)
    task = build(:task, cohort: cohort)
    expect(task.cohort).to eq(cohort)
  end

  it "has a method that converts due date to natural language" do
    task = build(:task)
    expect(task.due).to eq(Time.now.strftime("%b %d, %Y"))
  end

end
