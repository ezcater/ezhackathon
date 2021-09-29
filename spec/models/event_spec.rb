# frozen_string_literal: true

RSpec.describe Event do
  it { is_expected.to validate_presence_of(:time) }
  it { is_expected.to validate_presence_of(:place) }
  it { is_expected.to validate_presence_of(:agenda) }
  it { is_expected.to validate_presence_of(:participants) }

  it { is_expected.to have_many(:projects) }
end
