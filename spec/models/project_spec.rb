# frozen_string_literal: true

RSpec.describe Project do
  require "validate_url/rspec_matcher"

  it { is_expected.to belong_to(:event) }
  it { is_expected.to belong_to(:idea) }

  it { is_expected.to have_many(:votes).dependent(:destroy) }

  it { is_expected.to validate_url_of(:links) }
end
