# frozen_string_literal: true

FactoryBot.define do
  factory :task do
    priority { 1 }
    due_date { Time.now }
    description { "Send Emails!" }
    complete { false }
    group
  end
end
