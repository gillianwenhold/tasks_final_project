require "rails_helper"

Rspec.describe User, type: :model do
  let(:user) {
    User.create(
      username: "gillian",
      password: "pass",
      first_name: "Gillian"
      last_name: "Wenhold",
      grade: 17
    )
  }

  let(:cohort) {
    Cohort.create(
      name: "Education & Youth Justice",
      description: "The Education & Youth Justice Cohort"
    )
  }

  let(:task) {
    Cohort.create(
      priority: "Education & Youth Justice",
      description: "Email this person: ",
      complete: false
    )
  }
