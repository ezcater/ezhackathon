# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    association :idea
    association :event
  end
end
