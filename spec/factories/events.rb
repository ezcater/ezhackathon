# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    time { DateTime.now }
    place { "Virtual" }
    agenda { "10am hacking" }
    participants { "Rachael" }
    demo_links { "Coming soon." }
  end
end
