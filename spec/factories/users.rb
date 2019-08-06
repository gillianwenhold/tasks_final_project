# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { "gwenhold" }
    password { "password" }
    first_name { "Gillian" }
    last_name { "Wenhold" }
    grade { 17 }
    group
  end
end
