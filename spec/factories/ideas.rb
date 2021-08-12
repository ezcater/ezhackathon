# frozen_string_literal: true

FactoryBot.define do
  factory :idea do
    sequence(:name) { |n| "Idea name #{n}" }
    submitter { "Kai" }
    tagline { "Tagline!" }
    description { "Description!" }
    resources { "a number of engineers" }
    snowflake_access { true }
    value_delivered { "a lot of value" }
    goal { "to have fun" }
    hours_estimate { 15 }
  end
end
