# frozen_string_literal: true

FactoryBot.define do
  factory :user_task do
    user
    task
  end
end
