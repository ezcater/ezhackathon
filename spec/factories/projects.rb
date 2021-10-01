# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    association :idea
    association :event

    additional_comments { "This will be cool." }
  end
end
