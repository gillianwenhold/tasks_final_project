require "rails_helper"

RSpec.describe User, type: :model do
  let(:cohort) {
    Cohort.create(
      name: "Education & Youth Justice",
      description: "The Education & Youth Justice Cohort"
    )
  }

  let(:task) {
    Task.create(
      priority: 1,
      due_date: Time.now,
      description: "Email this person: ",
      complete: false,
      cohort_id: cohort.id
    )
  }

  it "is valid with a due date, description, and cohort" do
    expect(task).to be_valid
  end

  it "belongs to a cohort" do
    expect(task.cohort).to eq(cohort)
  end

  it "has a method that converts due date to natural language" do
    expect(task.due).to eq(Time.now.strftime("%b %d, %Y"))
  end

end
