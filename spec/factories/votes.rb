# frozen_string_literal: true

FactoryBot.define do
  factory :vote do
    award
    event
    project

    name { |n| "Lil Sebastian #{n}" }
  end
end
