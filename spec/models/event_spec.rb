# frozen_string_literal: true

RSpec.describe Event do
  it { is_expected.to validate_presence_of(:demo_links) }
  it { is_expected.to validate_presence_of(:time) }
  it { is_expected.to validate_presence_of(:place) }
  it { is_expected.to validate_presence_of(:agenda) }
  it { is_expected.to validate_presence_of(:participants) }
  it { is_expected.to validate_presence_of(:voting_status) }

  it { is_expected.to have_many(:projects) }
  it { is_expected.to have_many(:votes).dependent(:destroy) }
end
