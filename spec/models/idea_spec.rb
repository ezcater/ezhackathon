# frozen_string_literal: true

RSpec.describe Idea do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:tagline) }
  it { is_expected.to validate_length_of(:tagline).is_at_most(500) }
  it { is_expected.to validate_presence_of(:submitter) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:resources) }
  it { is_expected.to validate_presence_of(:value_delivered) }
  it { is_expected.to validate_presence_of(:goal) }
  it { is_expected.to validate_presence_of(:hours_estimate) }

  it { is_expected.to have_one(:project) }
end
